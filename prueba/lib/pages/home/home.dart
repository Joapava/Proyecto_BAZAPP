import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/components/barra_navegacion.dart';
import 'package:prueba/components/barra_navegacion_admin.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _InicioState();
}

class _InicioState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final prefs = Preferencias(); // Obtén la instancia de Preferencias

    return Scaffold(
      body: prefs.lvl == 2 ? const BarraNavegacionAdmin() : const BarraNavegacion(),
    );
  }
}
