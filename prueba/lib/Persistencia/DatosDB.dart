// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prueba/Class/Expositor.dart';
import 'package:prueba/Class/administrador.dart';
import 'package:prueba/Class/noticias_data.dart';
import 'package:http/http.dart' as http;

class DatosDB {
  
  Future<void> enableLocation(String idEspacio) async {
    var db = FirebaseFirestore.instance;
    await db.collection('espacio').doc(idEspacio).update({
      'disponibilidad': 'habilitado',
    });
  }

  Future<void> disableLocation(String idEspacio) async {
    var db = FirebaseFirestore.instance;
    await db.collection('espacio').doc(idEspacio).set({
      'id_espacio': idEspacio,
      'disponibilidad': 'deshabilitado',
    });
  }

  Future<List<String>> getDisabledLocations() async {
    var db = FirebaseFirestore.instance;
    var snapshot = await db
        .collection('espacio')
        .where('disponibilidad', isEqualTo: 'deshabilitado')
        .get();

    List<String> disabledLocations = [];
    for (var doc in snapshot.docs) {
      var data = doc.data();
      disabledLocations.add(data['id_espacio']);
    }
    return disabledLocations;
  }

  Future<List<Map<String, dynamic>>> getPurchaseHistory(
      String expositorId) async {
    var db = FirebaseFirestore.instance;
    var snapshot = await db
        .collection('compra')
        .where('id_expositor', isEqualTo: expositorId)
        .orderBy('fecha_compra', descending: true)
        .get();

    List<Map<String, dynamic>> purchaseHistory = [];
    for (var doc in snapshot.docs) {
      var data = doc.data();
      purchaseHistory.add({
        'id_espacio': data['id_espacio'],
        'fecha_compra': data['fecha_compra'],
        'precio_total': data['precio_total'],
      });
    }
    return purchaseHistory;
  }

  Future<List<String>> getAllOccupiedLocations() async {
    var db = FirebaseFirestore.instance;
    var snapshot = await db.collection('compra').get();

    List<String> allOccupiedLocations = [];
    for (var doc in snapshot.docs) {
      var data = doc.data();
      print(data); // Depurar datos
      if (data.containsKey('id_espacio') && data['id_espacio'] is String) {
        String idEspacio = data['id_espacio'];
        allOccupiedLocations.add(idEspacio);
      } else {
        print('Tipo de dato incorrecto para id_espacio: ${data['id_espacio']}');
      }
    }
    return allOccupiedLocations;
  }

  Future<List<String>> getPurchasedLocations(String expositorId) async {
    var db = FirebaseFirestore.instance;
    var snapshot = await db
        .collection('compra')
        .where('id_expositor', isEqualTo: expositorId)
        .get();

    List<String> purchasedLocations = [];
    for (var doc in snapshot.docs) {
      purchasedLocations.add(doc['id_espacio']);
    }
    return purchasedLocations;
  }

  Future<void> savePurchasedLocations(
  List<String> locations, String expositorId, double totalPrice) async {
  var db = FirebaseFirestore.instance;

  // Crea una copia de la lista para evitar modificaciones concurrentes
  List<String> locationsCopy = List.from(locations);

  for (String location in locationsCopy) {
    await db.collection('compra').add({
      'id_espacio': location,
      'id_expositor': expositorId,
      'fecha_compra': DateTime.now(),
      'precio_total': totalPrice,
    });
  }
}


  Future<List<Expositor>> getExpositores() async {
    List<Expositor> listaExpositores = [];
    var db = FirebaseFirestore.instance;
    await db.collection("expositores").get().then((event) {
      for (var doc in event.docs) {
        var data = doc.data();
        Expositor expositor = Expositor(
            id: data['id'],
            correo: data['correo'],
            apellidos: data['apellidos'],
            celular: data['celular'],
            nombre: data['nombre'],
            ntf: data['notificaciones']);
        listaExpositores.add(expositor);
      }
    });
    return listaExpositores;
  }

  Future<List<Administrador>> getAdmin() async {
    List<Administrador> listaAdministrador = [];
    var db = FirebaseFirestore.instance;
    await db.collection("administrador").get().then((event) {
      for (var doc in event.docs) {
        var data = doc.data();
        Administrador admin = Administrador(
            nivel: data['nivel'],
            idadministrador: data['id_administrador'],
            idexpositor: data['id_expositor']);
        listaAdministrador.add(admin);
      }
    });
    return listaAdministrador;
  }

  Future<bool> getNotificacion(String id) async {
    bool ntf;
    var db = FirebaseFirestore.instance;
    ntf = (await db.collection("expositores").doc(id).get()) as bool;
    return ntf;
  }

 Future<List<Noticia>> getNoticias() async {
  var db = FirebaseFirestore.instance;
  final QuerySnapshot result = await db.collection('noticias').get();

  final List<DocumentSnapshot> documents = result.docs;
  List<Noticia> noticiasCargadas = [];
  for (var doc in documents) {
    var data = doc.data() as Map<String, dynamic>?;

    if (data != null && data.containsKey('urlImagenNoticia') && data.containsKey('nombrePerfil') && data.containsKey('cuerpoNoticia')) {
      String imageUrl = data['urlImagenNoticia'];
      bool exists = await _imageExists(imageUrl);
      if (exists) {
        noticiasCargadas.add(
          Noticia(
            doc.id,
            '',
            data['nombrePerfil'],
            data['cuerpoNoticia'],
            imageUrl,
          ),
        );
      } else {
        // Eliminar noticia de Firebase si la imagen no existe
        await db.collection('noticias').doc(doc.id).delete();
      }
    } else {
      print("Warning: Missing required fields in document ${doc.id}");
    }
  }
  return noticiasCargadas;
}


  Future<List<String>> getImagenes() async {
    var db = FirebaseStorage.instance;
    ListResult result = await db.ref('Fotos').listAll();
    List<String> urls = [];
    for (var ref in result.items) {
      try {
        String url = await ref.getDownloadURL();
        urls.add(url);
      } catch (e) {
        print('Error al cargar la imagen: $e');
      }
    }
    return urls;
  }

  Future<bool> _imageExists(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      print('Error checking image existence: $e');
      return false;
    }
  }

  Future<void> deleteNoticia(String id, String imageUrl) async {
    var db = FirebaseFirestore.instance;
    final FirebaseStorage storage = FirebaseStorage.instance;

    // Eliminar la noticia de Firestore
    await db.collection('noticias').doc(id).delete();

    // Eliminar la imagen de Firebase Storage
    Reference photoRef = storage.refFromURL(imageUrl);
    await photoRef.delete();
  }

  Future<void> deleteImagen(String imageUrl) async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    // Eliminar la imagen de Firebase Storage
    Reference photoRef = storage.refFromURL(imageUrl);
    await photoRef.delete();
  }

  //Funcion para crear un nuevo expositor, el id se crea automaticamente con firebase

  Future setExpositor(Expositor ex, String id) async {
    var db = FirebaseFirestore.instance;
    final expositor = <String, dynamic>{
      "id": id,
      "correo": ex.correo,
      "notificaciones": true,
      "apellidos": ex.apellidos,
      "celular": ex.celular,
      "nombre": ex.nombre
    };

    db.collection("expositores").doc(id).set(expositor);
  }

  Future setNoticia(Noticia nc) async {
    var db = FirebaseFirestore.instance;

    final noticia = <String, dynamic>{
      'nombrePerfil': nc.nombrePerfil,
      'cuerpoNoticia': nc.cuerpoNoticia,
      'urlImagenNoticia': nc.urlImagenNoticia,
    };

    db.collection("noticias").add(noticia).then(
      (value) {
        db.collection("noticias").doc(value.id).update({"id": value.id});
      },
    );
  }

  Future<String> setImagen(File imageFile) async {
    String fileName = 'Fotos/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
    return await FirebaseStorage.instance.ref(fileName).getDownloadURL();
  }

  Future editarntf(String id, bool activado) async {
    var db = FirebaseFirestore.instance;
    final idRef = db.collection("expositores").doc(id);
    idRef.update({"notificaciones": activado}).then(
        (value) => print("Update Notificacion!"),
        onError: (e) => print("Error updating document $e"));
  }

  Future editarnombre(String id, String nombre, String apellido) async {
    var db = FirebaseFirestore.instance;
    final idRef = db.collection("expositores").doc(id);
    idRef.update({"nombre": nombre}).then((value) => print("Update name!"),
        onError: (e) => print("Error updating document $e"));
    idRef.update({"apellidos": apellido}).then(
        (value) => print("Update lastname!"),
        onError: (e) => print("Error updating document $e"));
  }

  Future editarcelular(String id, String celular) async {
    var db = FirebaseFirestore.instance;
    final idRef = db.collection("expositores").doc(id);
    idRef.update({"celular": celular}).then((value) => print("Update phone!"),
        onError: (e) => print("Error updating document $e"));
  }

  Future editarcorreo(String id, String correo) async {
    var db = FirebaseFirestore.instance;
    final idRef = db.collection("expositores").doc(id);
    idRef.update({"correo": correo}).then((value) => print("Update email!"),
        onError: (e) => print("Error updating document $e"));
  }
}
