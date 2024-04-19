import 'package:flutter/material.dart';
import 'package:prueba/components/barra_cuenta.dart';
import 'package:prueba/data/noticias_data.dart';

class paginaNoticias extends StatefulWidget {
  const paginaNoticias({super.key});

  @override
  State<paginaNoticias> createState() => _paginaNoticiasState();
}

class _paginaNoticiasState extends State<paginaNoticias> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: 
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const barraCuenta(),
              const Divider(),
              listaNoticias()
            ],
          ),
        ),
      );
  }
}

Widget listaNoticias() {
  return ListView.builder(
    shrinkWrap: true, // Esto hace que el ListView se ajuste al tamaño de sus hijos.
    physics: const NeverScrollableScrollPhysics(), // Esto deshabilita el propio desplazamiento del ListView.
    itemCount: noticias.length,
    itemBuilder: (context, index) {
      Noticia noticia = noticias[index];
      return formularioNoticia(
        noticia.urlImagenPerfil,
        noticia.nombrePerfil,
        noticia.cuerpoNoticia,
        noticia.urlImagenNoticia,
      );
    },
  );
}


Widget formularioNoticia(String urlImagenPerfil, String nombrePerfil, String cuerpoNoticia, String urlImagenNoticia)
{
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
    decoration: const BoxDecoration(
    color: Color.fromRGBO(168, 169, 171,0.2),
    borderRadius: BorderRadius.all(Radius.circular(10))
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
                        child: Image.network(urlImagenPerfil)
                  ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child:  Text(nombrePerfil,style: const TextStyle(fontWeight: FontWeight.bold),)),
            ],
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(cuerpoNoticia,textAlign: TextAlign.justify,)),
          ),

          Container(
            width: 500,
            height: 300,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(urlImagenNoticia, fit: BoxFit.cover))
            ),
      ],
    ),
  );
}
