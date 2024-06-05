import 'package:flutter/material.dart';
import 'package:prueba/Class/noticias_data.dart';
import 'package:prueba/Negocio/InsertarDatos.dart';
import 'package:prueba/Negocio/ValidarDatos.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/components/agregar_noticia.dart';
import 'package:prueba/pages/home/ImagenPagina.dart';
import 'package:http/http.dart' as http;

class PaginaNoticias extends StatefulWidget {
  const PaginaNoticias({super.key});

  @override
  State<PaginaNoticias> createState() => _PaginaNoticiasState();
}

class _PaginaNoticiasState extends State<PaginaNoticias> {
  Preferencias prefs = Preferencias();
  List<Noticia> noticias = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadNoticias();
      }
    });
  }

  Future<void> _loadNoticias() async {
    List<Noticia> noticiasCargadas = await ValidarDatos().getNoticias();
    if (mounted) {
      setState(() {
        noticias = noticiasCargadas;
      });
    }
  }

  void _agregarNuevaNoticia(Noticia nuevaNoticia) {
    InsertarDatos().setNoticia(nuevaNoticia);

    if (mounted) {
      setState(() {
        noticias.add(
          Noticia(
            nuevaNoticia.id,
            "lib/images-prueba/foto-bazar.jpg",
            nuevaNoticia.nombrePerfil,
            nuevaNoticia.cuerpoNoticia,
            nuevaNoticia.urlImagenNoticia,
          ),
        );
      });
    }
  }

  Future<void> _eliminarNoticia(int index) async {
    Noticia noticia = noticias[index];
    await InsertarDatos().deleteNoticia(noticia); // Elimina de la base de datos
    if (mounted) {
      setState(() {
        noticias.removeAt(index); // Elimina de la UI
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(),
              ListaNoticias(
                  noticias: noticias,
                  eliminarNoticia: _eliminarNoticia,
                  prefs: prefs),
            ],
          ),
        ),
        floatingActionButton: buttonadd(context),
      ),
    );
  }

  Widget buttonadd(BuildContext context) {
    if (prefs.lvl == 2) {
      return FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromRGBO(238, 235, 237, 1),
        onPressed: () async {
          final resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const agregar_noticia()),
          );
          if (resultado != null) {
            _agregarNuevaNoticia(resultado);
          }
        },
        child: const Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Icon(Icons.add_comment),
        ),
      );
    }
    return Container();
  }
}

class ListaNoticias extends StatelessWidget {
  final List<Noticia> noticias;
  final Function(int) eliminarNoticia;
  final Preferencias prefs;

  const ListaNoticias(
      {super.key,
      required this.noticias,
      required this.eliminarNoticia,
      required this.prefs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        var noticia = noticias[index];
        return FormularioNoticia(
          index: index,
          nombrePerfil: noticia.nombrePerfil,
          cuerpoNoticia: noticia.cuerpoNoticia,
          urlImagenNoticia: noticia.urlImagenNoticia,
          eliminarNoticia: eliminarNoticia,
          prefs: prefs,
        );
      },
    );
  }
}

class FormularioNoticia extends StatelessWidget {
  final int index;
  final String nombrePerfil;
  final String cuerpoNoticia;
  final String urlImagenNoticia;
  final Function(int) eliminarNoticia;
  final Preferencias prefs;

  const FormularioNoticia({
    super.key,
    required this.index,
    required this.nombrePerfil,
    required this.cuerpoNoticia,
    required this.urlImagenNoticia,
    required this.eliminarNoticia,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (prefs.lvl == 2) {
          // Solo permite eliminar si el nivel es 2
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Eliminar Noticia'),
                content: const Text(
                    '¿Estás seguro de que deseas eliminar esta noticia?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Eliminar'),
                    onPressed: () async {
                      await eliminarNoticia(
                          index); // Elimina de la base de datos y UI
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
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
                  margin: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                  child: Text(nombrePerfil,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                child: FutureBuilder<bool>(
                  future: _imageExists(urlImagenNoticia),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError ||
                        !snapshot.hasData ||
                        !snapshot.data!) {
                      return const Icon(Icons.broken_image);
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ImagenPagina(imageUrl: urlImagenNoticia),
                            ),
                          );
                        },
                        child: Image.network(
                          urlImagenNoticia,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
