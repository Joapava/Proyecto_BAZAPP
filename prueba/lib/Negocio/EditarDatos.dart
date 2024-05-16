// ignore_for_file: file_names

import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

class EditarDatos {
  final perfs = Preferencias();

  void cambiarntf(bool ntf) {
    DatosDB().editarntf(perfs.id, ntf);
  }

  void cambiarnombre(String id, String nombre, String apellido){
    DatosDB().editarnombre(id, nombre, apellido);
  }

  void cambiarcelular(String id, String celular){
    DatosDB().editarcelular(id, celular);
  }

  void cambiarcorreo(String id, String correo){
    DatosDB().editarcorreo(id, correo);
  }
}
