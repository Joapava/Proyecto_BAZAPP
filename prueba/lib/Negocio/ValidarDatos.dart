// ignore_for_file: file_names
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Objetos/Expositor.dart';

class ValidarDatos {
  Future<int> validar(String correo, String celular) async {
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
}
