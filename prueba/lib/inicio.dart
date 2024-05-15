import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/Auth.dart';
import 'package:prueba/pages/home.dart';
import 'package:prueba/pages/login.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(stream: Auth().authStateChanges, builder: (context, snapshot){
      if(snapshot.hasData){
        return const Home();
      } else {
        return const Login();
      }
    });
  }
}