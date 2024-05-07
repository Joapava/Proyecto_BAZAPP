import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba/Persistencia/Auth.dart';

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
      return '';
    }
  }

  Future<bool> reiniciarc(String email) async{
    try{
      await Auth().reiniciocontra(email);
      return true;
    }on FirebaseAuthException catch(_){
      return false;
    }
  }
}
