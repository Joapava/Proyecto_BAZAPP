
import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<String> setImagen(File imageFile) async {
    return await DatosDB().setImagen(imageFile);
  }

  Future<void> deleteNoticia(Noticia noticia) async {
    await DatosDB().deleteNoticia(noticia.id, noticia.urlImagenNoticia);
  }

  Future<void> deleteImagen(String imageUrl) async {
    await DatosDB().deleteImagen(imageUrl);
  }

    Future<String> setImagenAviso(File imageFile) async {
    String fileName = 'avisos/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
    return await FirebaseStorage.instance.ref(fileName).getDownloadURL();
  }
}
