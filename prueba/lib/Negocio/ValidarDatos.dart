// ignore_for_file: file_names
import 'package:prueba/Class/administrador.dart';
import 'package:prueba/Class/noticias_data.dart';
import 'package:prueba/Persistencia/Auth.dart';
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Class/Expositor.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

class ValidarDatos {
  Future<int> validarCelular(String celular) async {
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
        perfs.nombre = "${mayus(ex.nombre)} ${mayus(ex.apellidos)}";
        perfs.phone = ex.celular;
        perfs.notificaciones = ex.ntf;
        await administrador(id);
        return true;
      }
    }
    return false;
  }

  String mayus(String str) {
  if (str.isEmpty) {
    return str;
  }
  return str[0].toUpperCase() + str.substring(1).toLowerCase();
}

  Future<void> administrador(String id)async{
    final perfs = Preferencias();
    final List<Administrador> admins = await DatosDB().getAdmin();
    for(var ad in admins){
      if(id == ad.idexpositor){
        perfs.admin = ad.idadministrador;
        perfs.lvl = ad.nivel;
      }
    }
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

  Future<List<Noticia>> getNotificias() async{
    return await DatosDB().getNoticias();
  }
}
