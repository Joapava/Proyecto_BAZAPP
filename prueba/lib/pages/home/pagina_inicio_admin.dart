import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba/pages/home/imagen_pagina.dart';
import 'package:prueba/data/noticias_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prueba/pages/home/pagina_noticias.dart';

class PaginaInicioAdmin extends StatefulWidget {
  const PaginaInicioAdmin({super.key});

  @override
  State<PaginaInicioAdmin> createState() => _PaginaInicioAdminState();
}

class _PaginaInicioAdminState extends State<PaginaInicioAdmin> {
  List _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadimages();
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getDestacados(context),
            getDetalles(context),
            getFotos(context)
          ],
        ),
      ),
    );
  }

  Widget getDestacados(context) {
    List<Noticia> noticiasDestacadas = noticias.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: const Text(
            "Destacados",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: noticiasDestacadas.length,
            itemBuilder: (context, index) {
              return formatoNoticia(noticiasDestacadas[index], context);
            },
          ),
        ),
      ],
    );
  }

  Widget formatoNoticia(Noticia noticia, context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PaginaNoticias()))
      },
      child: Container(
        width: 270,
        margin: const EdgeInsets.all(10),
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
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(noticia.urlImagenPerfil),
                radius: 20,
              ),
              title: Text(noticia.nombrePerfil,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Text(noticia.cuerpoNoticia,
                  overflow: TextOverflow.ellipsis, maxLines: 2),
            ),
            if (noticia.urlImagenNoticia.isNotEmpty)
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    noticia.urlImagenNoticia,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
            child: const Text(
              "Detalles",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Arial"),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: const Text(
            "HORARIO:5:30-10:30 PM TODOS LOS VIERNES, SABADOS Y DOMINGOS💜💟🌈",
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            children: <Widget>[
              const Padding(
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
              const Padding(
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
              const Padding(
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
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                      child: const Text(
                        "Fotos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Arial",
                            fontSize: 25),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 25,0,0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: _pickImage,
                        child: const Text(
                          "Agregar Fotos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Arial",
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
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
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          (constraints.maxWidth / 150).floor();
          return GridView.extent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: listaImagenes(context),
          );
        },
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

  Future<void> _loadimages() async {
    ListResult result = await FirebaseStorage.instance.ref('uploads').listAll();
    List<String> urls = [];
    for (var ref in result.items) {
      String url = await ref.getDownloadURL();
      urls.add(url);
    }
    if (mounted) {
      setState(() {
        _imageUrls = urls;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
