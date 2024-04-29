// ignore_for_file: file_names
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Objetos/Expositor.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

class ValidarDatos {
  Future<int> validarRegistro(String correo, String celular) async {
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores) {
      if (correo == ex.correo && celular != ex.celular) {
        return 1;
      }
      if (celular == ex.celular && correo != ex.correo) {
        return 2;
      } else if (celular == ex.celular && correo == ex.correo) {
        return 3;
      }
    }
    return 0;
  }

  Future<bool> validarLogin(String correo, String password) async{
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores){
      if(correo == ex.correo && password == ex.password){
        final prefs = Preferencias();
        
        String nombre = ex.nombre;
        String apellido = ex.apellidos;

        nombre = nombre[0].toUpperCase() + nombre.substring(1);
        apellido = apellido[0].toUpperCase() + apellido.substring(1);
        prefs.email = ex.correo;
        prefs.id = ex.id;
        prefs.nombre = '$nombre $apellido';
        prefs.phone = ex.celular;
        return true;
      }
    }
    return false;
  }

  Future<bool> registroemail(String correo) async{
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores){
      if(correo == ex.correo){
        return true;
      }
    }
    return false;
  }

  Future<bool> registrocelular(String celular) async{
    final List<Expositor> expositores = await DatosDB().getExpositores();
    for (var ex in expositores){
      if(celular == ex.celular){
        return true;
      }
    }
    return false;
  }
}
