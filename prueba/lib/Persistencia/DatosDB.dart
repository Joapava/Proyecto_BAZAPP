// ignore_for_file: file_names, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba/Class/Expositor.dart';
import 'package:prueba/Class/administrador.dart';

class DatosDB {
  //Funcion que regresa los expositores que han sido creado en forma de lista

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

  //Funcion para crear un nuevo expositor, el id se crea automaticamente con firebase

  Future setExpositor(Expositor ex, String id) async {
    var db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
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

  //Funcion para editar el boleano de las notificaciones
  // con esto podra recibir o no las notificaciones PUSH

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
