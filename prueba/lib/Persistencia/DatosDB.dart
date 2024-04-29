// ignore_for_file: file_names, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba/Objetos/Expositor.dart';

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
            apellidos: data['apellidos'],
            celular: data['celular'],
            password: data['contrasena'],
            correo: data['correo'],
            nombre: data['nombre']);
        listaExpositores.add(expositor);
      }
    });
    return listaExpositores;
  }

  //Funcion para crear un nuevo expositor, el id se crea automaticamente con firebase

  Future setExpositor(Expositor ex) async {
    var db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final expositor = <String, dynamic>{
      "notificaciones": true,
      "apellidos": ex.apellidos,
      "celular": ex.celular,
      "contrasena": ex.password,
      "correo": ex.correo,
      "nombre": ex.nombre
    };

    db
        .collection("expositores")
        .add(expositor)
        .then((DocumentReference doc) => colocarid(doc.id));
  }

  //Funcion para colocar el id del expositor en el campo id de la Base de datos

  Future colocarid(String id) async {
    var db = FirebaseFirestore.instance;
    final idRef = db.collection("expositores").doc(id);
    idRef.update({"id": id}).then((value) => print("DocumentSnapshot updated!"),
        onError: (e) => print("Error updating document $e"));
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
    idRef.update({"nombre": nombre}).then(
        (value) => print("Update name!"),
        onError: (e) => print("Error updating document $e"));
    idRef.update({"apellidos": apellido}).then(
        (value) => print("Update lastname!"),
        onError: (e) => print("Error updating document $e"));
  }

  Future editarcelular(String id, String celular) async {
    var db = FirebaseFirestore.instance;
    final idRef = db.collection("expositores").doc(id);
    idRef.update({"celular": celular}).then(
        (value) => print("Update phone!"),
        onError: (e) => print("Error updating document $e"));
  }

  Future editarcorreo(String id, String correo) async {
    var db = FirebaseFirestore.instance;
    final idRef = db.collection("expositores").doc(id);
    idRef.update({"correo": correo}).then(
        (value) => print("Update email!"),
        onError: (e) => print("Error updating document $e"));
  }
}
