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
      body: BarraNavegacion()
    );
  }
}