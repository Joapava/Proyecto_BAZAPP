import 'package:flutter/material.dart';
import 'package:prueba/Class/aviso.dart';

class AvisoDetallePage extends StatelessWidget {
  final Aviso aviso;

  const AvisoDetallePage({Key? key, required this.aviso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aviso.titulo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(aviso.cuerpo),
              SizedBox(height: 16),
              if (aviso.imageUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    aviso.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  aviso.fecha,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
