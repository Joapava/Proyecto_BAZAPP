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
      decoration: const BoxDecoration(
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
                height:
                    800, // Ajusta esta altura basada en el contenido interno
                child: Stack(
                  children: <Widget>[
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.vertical,
                        startingLabel: "A",
                        x: 10,
                        y: 10),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 10),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 50),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 80),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 120),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 150),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 190),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 220),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "A",
                        x: 80,
                        y: 255),
                    generatePositionedButtons(
                        count: 25,
                        direction: ButtonDirection.vertical,
                        startingLabel: "P",
                        x: 395,
                        y: 10),
                    generatePositionedButtons(
                        count: 10,
                        direction: ButtonDirection.vertical,
                        startingLabel: "P",
                        x: 340,
                        y: 295),
                    generatePositionedButtons(
                        count: 6,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "E",
                        x: 150,
                        y: 528),
                    generatePositionedButtons(
                        count: 3,
                        direction: ButtonDirection.horizontal,
                        startingLabel: "E",
                        x: 245,
                        y: 610),
                    generatePositionedButtons(
                        count: 3,
                        direction: ButtonDirection.vertical,
                        startingLabel: "E",
                        x: 330,
                        y: 645),
                    generatePositionedButtons(
                        count: 4,
                        direction: ButtonDirection.vertical,
                        startingLabel: "E",
                        x: 220,
                        y: 645),
                    generatePositionedButtons(
                        count: 4,
                        direction: ButtonDirection.vertical,
                        startingLabel: "E",
                        x: 140,
                        y: 645),
                    generatePositionedButtons(
                        count: 5,
                        direction: ButtonDirection.vertical,
                        startingLabel: "E",
                        x: 80,
                        y: 645),
                    generatePositionedButtons(
                        count: 8,
                        direction: ButtonDirection.vertical,
                        startingLabel: "E",
                        x: 10,
                        y: 560),

                    //Edificio CNC
                    Positioned(
                      left: 40,
                      top: 300,
                      child: Container(
                        height: 200,
                        width: 295,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(168, 169, 171, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Text("CNC",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),

                    //Entrada secundaria
                    Positioned(
                      left: 350,
                      top: 0,
                      child: Container(
                        height: 20,
                        width: 65,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(168, 169, 171, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Center(
                          child: Text("Entrada",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),

                    //Entrada principal
                    Positioned(
                      left: 325,
                      top: 770,
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(168, 169, 171, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Center(
                          child: Text("Entrada",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
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
