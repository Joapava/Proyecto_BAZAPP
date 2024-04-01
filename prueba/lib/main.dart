import 'package:flutter/material.dart';
import 'package:prueba/pages/inicio.dart';
import 'package:prueba/pages/registro.dart';

void main(){
  runApp(const BazzApp());
}
class BazzApp extends StatelessWidget {
  const BazzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: "Bazz App",
      debugShowCheckedModeBanner: false,
      home: Registro(),
    );
  }
}






