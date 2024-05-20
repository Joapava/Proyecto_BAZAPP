// ignore_for_file: file_names
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prueba/Persistencia/Auth.dart';
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Objetos/Expositor.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

class ValidarDatos {
  Future<int> validarRegistro(String celular) async {
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores) {
      if (celular == ex.celular) {
        return 1;
      }
    }
    return 0;
  }

  Future<bool> datoslogin(String id) async {
    final perfs = Preferencias();
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores) {
      if (id == ex.id) {
        perfs.email = ex.correo;
        perfs.id = id;
        perfs.nombre = "${ex.nombre} ${ex.apellidos}";
        perfs.phone = ex.celular;
        perfs.notificaciones = ex.ntf;
        return true;
      }
    }
    return false;
  }

  Future<void> administrador(String id)async{
    final perfs = Preferencias();
    
  }
  
  Future<List> loadimages()async{
    return await Auth().loadImages();
  }

  Future<bool> sindatosemail(String email) async {
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores) {
      if (email == ex.correo) {
        return true;
      }
    }
    return false;
  }

  Future<bool> registrocelular(String celular) async {
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores) {
      if (celular == ex.celular) {
        return true;
      }
    }
    return false;
  }

  Future<void> createUser(String email, String pwd) async {
    await Auth().createUser(email: email, pwd: pwd);
  }

  Future<void> signIn(String email, String pwd) async {
    await Auth().signIn(email: email, pwd: pwd);
  }

  Future<void> singOut() async {
    await Auth().signOut();
  }
}
