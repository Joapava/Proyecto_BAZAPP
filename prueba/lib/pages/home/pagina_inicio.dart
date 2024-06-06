import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba/Class/aviso.dart';
import 'package:prueba/Negocio/ValidarDatos.dart';
import 'package:prueba/pages/home/aviso_detalle_page.dart';
import 'package:prueba/pages/home/imagen_pagina.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:prueba/generated/l10n.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  List<Aviso> avisos = [];
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
    _loadAvisos();
  }

  Future<void> _loadAvisos() async {
    List<Aviso> avisosCargados = await ValidarDatos().getAvisos();
    if (mounted) {
      setState(() {
        avisos = avisosCargados;
      });
    }
  }

  Future<bool> _imageExists(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      print('Error checking image existence: $e');
      return false;
    }
  }

  Future<void> _loadImages() async {
    ListResult result = await FirebaseStorage.instance.ref('Fotos').listAll();
    List<String> urls = [];
    for (var ref in result.items) {
      try {
        String url = await ref.getDownloadURL();
        urls.add(url);
      } catch (e) {
        print('Error al cargar la imagen: $e');
      }
    }
    if (mounted) {
      setState(() {
        _imageUrls = urls;
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      String fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}.jpg';
      try {
        await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        String downloadURL =
            await FirebaseStorage.instance.ref(fileName).getDownloadURL();
        if (mounted) {
          setState(() {
            _imageUrls.add(downloadURL);
          });
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, .98),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getDestacados(context),
            getDetalles(context),
            getFotos(context),
          ],
        ),
      ),
    );
  }
 Widget getDestacados(context) {
    // Filtrar los avisos que están activos
    List<Aviso> avisosActivos =
        avisos.where((aviso) => aviso.estado == 'Activo').toList();

    // Tomar los primeros 3 avisos activos
    List<Aviso> avisosDestacados = avisosActivos.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Text(
            S.of(context).home_ads,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 300, // Ajustar altura del contenedor
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: avisosDestacados.length,
            itemBuilder: (context, index) {
              return formatoAviso(avisosDestacados[index], context);
            },
          ),
        ),
      ],
    );
  }

  Widget formatoAviso(Aviso aviso, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AvisoDetallePage(aviso: aviso),
          ),
        );
      },
      child: Container(
        width: 270, // Ajustar ancho del contenedor
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10), // Añadir padding para el texto
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              aviso.titulo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Text(
                aviso.cuerpo,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 5), // Reduced space
            if (aviso.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  aviso.imageUrl,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  aviso.fecha,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget getDetalles(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Text(
              S.of(context).home_details,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Arial"),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: const Text(
            "HORARIO: 5:30-10:30 PM TODOS LOS VIERNES, SABADOS Y DOMINGOS💜💟🌈",
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: const Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.info_rounded,
                      color: Color.fromRGBO(168, 169, 171, 1.0),
                    ),
                    Text(
                      " Página · ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Emprendedor")
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions,
                      color: Color.fromRGBO(168, 169, 171, 1.0),
                    ),
                    Expanded(
                      child: Text(
                        " CNC sobre boulevard López Mateos entre el PRI y Smart & final",
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_rounded,
                      color: Color.fromRGBO(168, 169, 171, 1.0),
                    ),
                    Text(" Calificación · 5.0 (13 opiniones)")
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                child: Text(
                  S.of(context).home_photos,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Arial",
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getFotos(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      width: 700,
      height: 400,
      child: GridView.extent(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        maxCrossAxisExtent: 150,
        children: listaImagenes(context),
      ),
    );
  }

  List<Widget> listaImagenes(BuildContext context) {
    List<Widget> listaImagenes = [];

    for (int i = 0; i < _imageUrls.length; i++) {
      var imageUrl = _imageUrls[i];
      listaImagenes.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => imagenPagina(
                    imageName: imageUrl,
                  ),
                ),
              );
            },
            child: Hero(
              tag: '$imageUrl$i',
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
        ),
      );
    }

    return listaImagenes;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
