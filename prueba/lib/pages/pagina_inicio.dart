// ignore: file_names
import 'package:flutter/material.dart';
import 'package:prueba/data/imagenes_data.dart';
import 'package:prueba/pages/imagen_pagina.dart';
import 'package:prueba/data/noticias_data.dart';


class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {

  /*   
     List<String> fotos = [
  'https://i.pinimg.com/originals/bd/3f/31/bd3f31f58faac16f3e6bc177d9da44c4.jpg',
  'https://i.pinimg.com/originals/bd/3f/31/bd3f31f58faac16f3e6bc177d9da44c4.jpg',
  // Añade más URLs de imágenes según sea necesario
];
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
             getDestacados(),
             getDetalles(),
             getFotos(context)
           
        
          ],
        ),
      ),
    );
  }
}

Widget getDestacados() {
  // Lista filtrada o seleccionada de noticias destacadas
  // Aquí, como ejemplo, simplemente tomamos las primeras 3 noticias.
  // Puedes ajustar este código para seleccionar las noticias que desees mostrar como destacadas.
  List<Noticia> noticiasDestacadas = noticias.take(3).toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Ajuste para alinear el título a la izquierda
    children: [
      // Título
      Container(
        margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
        child: const Text(
          "Destacados",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      // Lista horizontal de noticias destacadas
      SizedBox(
        height: 300, // Ajusta según el tamaño deseado de las tarjetas de noticias
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: noticiasDestacadas.length,
          itemBuilder: (context, index) {
            // Utiliza el widget formatoNoticia para cada noticia destacada
            return formatoNoticia(noticiasDestacadas[index]);
          },
        ),
      ),
    ],
  );
}

Widget formatoNoticia(Noticia noticia) {
  return Container(
    width: 270, // Ancho fijo para cada tarjeta de noticia
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
            backgroundImage: NetworkImage(noticia.urlImagenPerfil),
            radius: 20,
          ),
          title: Text(noticia.nombrePerfil, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Text(noticia.cuerpoNoticia,overflow: TextOverflow.ellipsis, maxLines: 2, )),

        if (noticia.urlImagenNoticia.isNotEmpty)
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              child: Image.network(
                noticia.urlImagenNoticia,
                width: double.infinity, // Asegura que la imagen llene el espacio disponible en ancho.
                // No se necesita definir una altura específica aquí ya que Expanded lo manejará.
                fit: BoxFit.cover, // La imagen se ajustará dentro del contenedor, mostrándose completa.
              ),
            ),
          ),
      ],
    ),
  );
}


Widget getDetalles()
{
  return Column(
    children: <Widget>[
      Align(
          alignment: Alignment.topLeft,
          child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
              children: listaImagenes(context),
        ),
     );
}

List<Widget> listaImagenes(BuildContext context) {
  List<Widget> listaImagenes = [];

  for (int i = 0; i < images.length; i++) {
    var imagenesData = images[i];
    listaImagenes.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => imagenPagina(url: imagenesData)));
          },
          child: Hero(
            tag: '$imagenesData$i', // Modificado para incluir el índice
            child: Image.network(imagenesData, fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }

  return listaImagenes;
}


