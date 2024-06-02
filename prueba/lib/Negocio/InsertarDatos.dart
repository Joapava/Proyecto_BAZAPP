import 'package:prueba/Class/noticias_data.dart';
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Class/Expositor.dart';

class InsertarDatos{
  void setExpositor(Expositor ex, String id){
    DatosDB().setExpositor(ex, id);
  }

  void setNoticia(Noticia noticia){
    DatosDB().setNoticia(noticia);
  }
}