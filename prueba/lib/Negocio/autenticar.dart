import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba/Negocio/ValidarDatos.dart';
import 'package:prueba/Persistencia/Auth.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/Persistencia/auth_google.dart';

class Autenticar {
  Future<String> cambiarpwd(String pwd) async {
    try {
      await Auth().cambiarpwd(pwd);
      return 'Actualizado con exito';
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future<String> iniciarsesion(
      {required String email, required String pwd}) async {
    try {
      var ex = await Auth().signIn(email: email, pwd: pwd);
      if (ex != null) {
        return ex;
      }
      return '';
    } on FirebaseAuthException catch (_) {
      return '';
    }
  }

  Future<String> crearU({required String email, required String pwd}) async {
    try {
      String r = await Auth().createUser(email: email, pwd: pwd);
      return r;
    } on FirebaseAuthException catch (_) {
      bool registrado = await ValidarDatos().sindatosemail(email);
      if (!registrado) {
        return 'nodata';
      }
      return '';
    }
  }

  Future<bool> reiniciarc(String email) async {
    try {
      await Auth().reiniciocontra(email);
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    }
  }

  Future<bool> google() async {
    Preferencias perfs = Preferencias();
    try {
      final user = await Authgoole().loginGoogle();
      if (user != null) {
        perfs.id = user.uid;
        List<String> nombrec = user.displayName.toString().split(" ");
        perfs.nombre = "${nombrec[0]} ${nombrec[1]}";
        perfs.email = user.email.toString();
        bool registrado = await ValidarDatos().datoslogin(perfs.id);
        if (!registrado) {
          return false;
        }
        return true;
      }
    } on FirebaseAuthException catch (_) {}
    return false;
  }
}
