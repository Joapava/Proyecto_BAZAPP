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
    final washingtonRef = db.collection("expositores").doc(id);
    washingtonRef.update({"id": id}).then(
        (value) => print("DocumentSnapshot updated!"),
        onError: (e) => print("Error updating document $e"));
  }

  //Funcion para editar registros ya existentes

  Future editard(String id, int n) async{
    var db = FirebaseFirestore.instance;
    if(n == 1){

    }
    else if(n ==2 ){

    }
  }
}
