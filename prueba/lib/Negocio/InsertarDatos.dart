import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Class/Expositor.dart';

class InsertarDatos{
  void setExpositor(Expositor ex, String id){
    DatosDB().setExpositor(ex, id);
  }
}