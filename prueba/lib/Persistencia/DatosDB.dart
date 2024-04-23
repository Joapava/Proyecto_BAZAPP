// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba/Objetos/Expositor.dart';

class DatosDB {
  Future<List<Expositor>> getExpositores() async {
    List<Expositor> listaExpositores = [];
    var db = FirebaseFirestore.instance;
    await db.collection("expositores").get().then((event) {
      for (var doc in event.docs) {
        var data = doc.data();
        Expositor expositor = Expositor(
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

  Future setExpositor(Expositor ex) async {
    var db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final expositor = <String, dynamic>{
      "apellidos": ex.apellidos,
      "celular": ex.celular,
      "contrasena": ex.password,
      "correo": ex.correo,
      "nombre": ex.nombre
    };

// Add a new document with a generated ID
    db.collection("expositores").add(expositor).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
