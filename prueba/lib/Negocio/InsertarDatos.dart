import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Objetos/Expositor.dart';

class InsertarDatos{
  void setExpositor(Expositor ex, String id){
    DatosDB().setExpositor(ex, id);
  }
}