import "package:flutter/material.dart";
import 'package:photo_view/photo_view.dart';

// ignore: camel_case_types
class imagenPagina extends StatelessWidget {
  final String imageName;

  const imagenPagina({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // Fondo más oscuro para mejor contraste
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white), // Icono blanco para mejor visibilidad
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20), // Margen para la visualización de la imagen
                child: PhotoView(
                  imageProvider: NetworkImage(imageName), // Utilizar NetworkImage para cargar la imagen desde la URL
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black, // Fondo del área de zoom
                  ),
                ),
              ),
            ),
            const Divider(thickness: 1, color: Colors.black), // Divider visible
          ],
        ),
      ),
    );
  }
}
