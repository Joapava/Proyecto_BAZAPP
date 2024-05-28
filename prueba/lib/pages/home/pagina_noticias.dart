import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba/components/agregar_noticia.dart';
import 'package:prueba/data/noticias_data.dart';

class PaginaNoticias extends StatefulWidget {
  const PaginaNoticias({super.key});

  @override
  State<PaginaNoticias> createState() => _PaginaNoticiasState();
}

class _PaginaNoticiasState extends State<PaginaNoticias> {
  List<Noticia> noticias = [];

  @override
  void initState() {
    super.initState();
    _loadNoticias();
  }

  Future<void> _loadNoticias() async {
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('noticias').get();
    final List<DocumentSnapshot> documents = result.docs;
    List<Noticia> noticiasCargadas = [];
    for (var doc in documents) {
      noticiasCargadas.add(
        Noticia(
          "lib/images-prueba/foto-bazar.jpg",
          doc['nombre'],
          doc['cuerpo'],
          doc['imagenUrl'],
        ),
      );
    }
    setState(() {
      noticias = noticiasCargadas;
    });
  }

  void _agregarNuevaNoticia(Map<String, dynamic> nuevaNoticia) {
    FirebaseFirestore.instance.collection('noticias').add({
      'nombre': nuevaNoticia['nombre'],
      'cuerpo': nuevaNoticia['cuerpo'],
      'imagenUrl': nuevaNoticia['imagenUrl'],
    });

    setState(() {
      noticias.add(
        Noticia(
          "lib/images-prueba/foto-bazar.jpg",
          nuevaNoticia['nombre'],
          nuevaNoticia['cuerpo'],
          nuevaNoticia['imagenUrl'],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(),
              ListaNoticias(noticias: noticias),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: 110,
          child: FloatingActionButton(
            onPressed: () async {
              final resultado = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const agregar_noticia()),
              );
              if (resultado != null) {
                _agregarNuevaNoticia(resultado);
              }
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text("Agregar Noticia"),
            ),
          ),
        ),
      ),
    );
  }
}

class ListaNoticias extends StatelessWidget {
  final List<Noticia> noticias;

  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        var noticia = noticias[index];
        return FormularioNoticia(
          nombrePerfil: noticia.nombrePerfil,
          cuerpoNoticia: noticia.cuerpoNoticia,
          urlImagenNoticia: noticia.urlImagenNoticia,
        );
      },
    );
  }
}

class FormularioNoticia extends StatelessWidget {
  final String nombrePerfil;
  final String cuerpoNoticia;
  final String urlImagenNoticia;

  const FormularioNoticia({
    Key? key,
    required this.nombrePerfil,
    required this.cuerpoNoticia,
    required this.urlImagenNoticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Text(nombrePerfil,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
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
              child: Image.network(urlImagenNoticia, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
