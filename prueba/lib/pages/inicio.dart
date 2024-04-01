import 'package:flutter/material.dart';
import 'package:prueba/barra_navegacion.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Good \nMorning", style: TextStyle(color: Color.fromRGBO(113, 147, 156,1.0), fontWeight: FontWeight.bold, fontFamily: "Times New Roman", fontSize: 25 ), ),
          backgroundColor: const Color.fromRGBO(168, 169, 171,0.1),
          toolbarHeight: 85,
          actions: [
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(113, 147, 156,0.2),
              ),
              child: IconButton(
               //   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  onPressed: (){}, 
                  icon: const Icon(Icons.notifications_active_outlined) 
                  ),
            )
          ],
      ),
      body: const BarraNavegacion()
    );
  }
}