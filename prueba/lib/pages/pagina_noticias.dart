import 'package:flutter/material.dart';
import 'package:prueba/data/noticias_data.dart';

class PaginaNoticias extends StatefulWidget {
  const PaginaNoticias({super.key});

  @override
  State<PaginaNoticias> createState() => _PaginaNoticiasState();
}

class _PaginaNoticiasState extends State<PaginaNoticias> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            Divider(),
            ListaNoticias(),
          ],
        ),
      ),
    );
  }
}

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(),
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        var noticia = noticias[index];
        return FormularioNoticia(
          urlImagenPerfil: noticia.urlImagenPerfil, // Asegúrate de actualizar la ruta
          nombrePerfil: noticia.nombrePerfil,
          cuerpoNoticia: noticia.cuerpoNoticia,
          urlImagenNoticia: noticia.urlImagenNoticia, // Asegúrate de actualizar la ruta
        );
      },
    );
  }
}

class FormularioNoticia extends StatelessWidget {
  final String urlImagenPerfil;
  final String nombrePerfil;
  final String cuerpoNoticia;
  final String urlImagenNoticia;

  const FormularioNoticia({
    Key? key,
    required this.urlImagenPerfil,
    required this.nombrePerfil,
    required this.cuerpoNoticia,
    required this.urlImagenNoticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(168, 169, 171, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(urlImagenPerfil),  // Cambiado a Image.asset
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Text(nombrePerfil, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(cuerpoNoticia, textAlign: TextAlign.justify),
            ),
          ),
          Container(
            width: 500,
            height: 300,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(urlImagenNoticia, fit: BoxFit.cover),  // Cambiado a Image.asset
            ),
          ),
        ],
      ),
    );
  }
}