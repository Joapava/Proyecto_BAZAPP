import 'package:flutter/material.dart';
import 'package:prueba/components/barra_navegacion.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  appBar: AppBar(
      //     titleSpacing: 0.0,
      //     title: Container(
      //       margin: const EdgeInsets.only(left: 10),
      //       child: const Text("\nBAZAR Vintage Clothing", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.bold, fontFamily: "Arial", fontSize: 23 ), )),
          
      // ),
      body: BarraNavegacion()
    );
  }
}