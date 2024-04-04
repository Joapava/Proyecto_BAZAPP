// ignore: file_names
import 'package:flutter/material.dart';
import 'package:prueba/barra_cuenta.dart';
import 'package:prueba/data/imagenes_data.dart';
import 'package:prueba/pages/imagen_pagina.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
     
     List<String> fotos = [
  'https://i.pinimg.com/originals/bd/3f/31/bd3f31f58faac16f3e6bc177d9da44c4.jpg',
  'https://i.pinimg.com/originals/bd/3f/31/bd3f31f58faac16f3e6bc177d9da44c4.jpg',
  // Añade más URLs de imágenes según sea necesario
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
              const barraCuenta(),
              getDetalles(),
             getFotos(context)
           
        
          ],
        ),
      ),
    );
  }
}

Widget getDetalles()
{
  return Column(
    children: <Widget>[
      Align(
          alignment: Alignment.topLeft,
          child: Container(
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                    child: const Text("Detalles", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: ("Arial")),)
                    )
          ),

      
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: const Text("HORARIO:5:30-10:30 PM TODOS LOS VIERNES, SABADOS Y DOMINGOS💜💟🌈", textAlign: TextAlign.center,),
        ),
      
      const Divider(
          indent: 15,
          endIndent: 15,
      ),

      Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child:  Column (
                children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                  Icon(Icons.info_rounded,color:Color.fromRGBO(168, 169, 171,1.0), ),
                  Text(" Página · ",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Emprendedor")
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                  Icon(Icons.directions,color:Color.fromRGBO(168, 169, 171,1.0),),
                  Expanded(
                    child: Text(" CNC sobre boulevard López Mateos entre el PRI y Smart & final",softWrap: true, textAlign: TextAlign.justify,))
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                  Icon(Icons.star_rounded,color:Color.fromRGBO(168, 169, 171,1.0),),
                  Text(" Calificación · 5.0 (13 opiniones)")
                ],
              ),
            ),

                Align(
                alignment: Alignment.topLeft,
                child:
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                    child: const Text("Fotos", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Arial", fontSize: 25),))
                ),

          ],
        ),
      ),
    ],
  );
}

Widget getFotos(BuildContext context)
{
  return 
     Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 10, 5),
      width: 700,
      height: 400,
       child: GridView.extent(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              maxCrossAxisExtent: 150,
              // children: listaImagenes(context),
        ),
     );
}

List<Widget>  listaImagenes(BuildContext context) {
  List<Widget> listaImagenes = [];

  for(var imagenesData in images){
    listaImagenes.add(
      ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => imagenPagina(url: imagenesData)));
                      },
                      child: Hero(
                                tag: imagenesData,
                                child: Image.network(imagenesData,fit: BoxFit.cover,))))
    );

  }

  return listaImagenes;
}

