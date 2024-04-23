import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba/components/generar_botones.dart';

class PaginaPuestos extends StatefulWidget {
  const PaginaPuestos({super.key});

  @override
  State<PaginaPuestos> createState() => _PaginaPuestosState();
}

class _PaginaPuestosState extends State<PaginaPuestos> {
  @override
  Widget build(BuildContext context) {
    return contenedorPuestos();
  }
}

Widget contenedorPuestos() {
  return Scaffold(
    body: Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 450, // Ancho fijo para el contenedor
      decoration:  const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(168, 169, 171, 0.2)),
      child: SizedBox(
        height: 500, // Altura fija para el contenedor
        child: SingleChildScrollView(
          // Habilita el desplazamiento vertical dentro de la altura fija
          child: Stack(
            children: [
              // La altura de este contenedor debe ser suficiente para contener todos los botones
              // Coloca el Stack directamente aquí si es parte de lo que se quiere hacer scroll
              SizedBox(
                // Asegúrate de que este alto sea suficiente para cubrir el espacio que necesitan tus botones
                // Este alto se ajusta para demostrar el desplazamiento; ajusta según la necesidad
                height: 800, // Ajusta esta altura basada en el contenido interno
                child: Stack(
                  children: <Widget>[
                    
              generatePositionedButtons( count: 10, direction: ButtonDirection.vertical, startingLabel: "", x: 10, y: 10,),
                
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 10,),
              
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 50,),
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 75,),
              
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 115,),
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 140,),
              
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 180,),
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 205,),
              
              generatePositionedButtons( count: 10, direction: ButtonDirection.horizontal, startingLabel: "", x: 80, y: 245,),
              
              //pasillo
              generatePositionedButtons( count: 25, direction: ButtonDirection.vertical, startingLabel: "", x: 395, y: 10,),
              generatePositionedButtons( count: 10, direction: ButtonDirection.vertical, startingLabel: "", x: 330, y: 275,),
                
              generatePositionedButtons( count: 6, direction: ButtonDirection.horizontal, startingLabel: "", x: 180, y: 530,),
                
              generatePositionedButtons( count: 3, direction: ButtonDirection.horizontal, startingLabel: "", x: 250, y: 600,),
              
              generatePositionedButtons( count: 3, direction: ButtonDirection.vertical, startingLabel: "", x: 330, y: 630,),
              
              generatePositionedButtons( count: 4, direction: ButtonDirection.vertical, startingLabel: "", x: 220, y: 630,),
                
              generatePositionedButtons( count: 4, direction: ButtonDirection.vertical, startingLabel: "", x: 140, y: 630,),
                
              generatePositionedButtons( count: 5, direction: ButtonDirection.vertical, startingLabel: "", x: 80, y: 630,),
                
              generatePositionedButtons( count: 8, direction: ButtonDirection.vertical, startingLabel: "", x: 10, y: 560,),
      
              //Edificio CNC
              Positioned(
                left: 40,
                top:300,
                child: Container(
                  height: 200,
                  width: 280,  
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(168, 169, 171, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  child: const Center(
                    child: Text("CNC",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
              ),

              //Entrada secundario
              Positioned(
                left: 325,
                top:0,
                child: Container(
                  height: 20,
                  width: 65,  
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(168, 169, 171, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                  child: const Center(
                    child: Text("Entrada",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
              ),

              //Entrada Principal
              Positioned(
                left: 325,
                top: 770,
                child: Container(
                  height: 30,
                  width: 100,  
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(168, 169, 171, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                  child: const Center(
                    child: Text("Entrada",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
              ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


