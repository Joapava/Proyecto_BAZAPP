// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/pages/registro.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFour, itemFive, itemsix}
SampleItem? selectedMenu;

SampleItem? giro;

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            FloatingActionButton(onPressed:(() => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Registro()))),)
          ],
        ),
      ),) 
    );
  }
}

