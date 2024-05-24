import 'package:flutter/material.dart';
import 'package:prueba/components/barra_navegacion.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _InicioState();
}

class _InicioState extends State<Home> {
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