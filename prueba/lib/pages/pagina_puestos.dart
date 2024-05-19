import 'package:flutter/material.dart';
import 'package:prueba/components/generar_botones.dart';
import 'package:prueba/components/informacion_compra_puesto.dart';

class PaginaPuestos extends StatefulWidget {
  const PaginaPuestos({super.key});

  @override
  State<PaginaPuestos> createState() => _PaginaPuestosState();
}

class _PaginaPuestosState extends State<PaginaPuestos> {
  void updateState() {
    setState(() {});
  }

  // Función para generar etiquetas únicas con letras y números consecutivos
  List<String> generateLabels(String letter, int start, int count) {
    return List<String>.generate(count, (index) => '$letter${start + index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        contenedorPuestos(updateState),
        visualizarInformacionCompta(),
      ],
    );
  }

  Widget contenedorPuestos(Function updateCallback) {
    int startLabel = 0;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 450,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(168, 169, 171, 0.2),
        ),
        child: SizedBox(
          height: 500,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: 800,
                  child: Stack(
                    children: <Widget>[
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel, 10),
                          direction: ButtonDirection.vertical,
                          x: 10,
                          y: 20,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 20,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 60,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 90,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 130,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 160,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 200,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 230,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("A", startLabel += 10, 10),
                          direction: ButtonDirection.horizontal,
                          x: 80,
                          y: 265,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("P", startLabel += 10, 25),
                          direction: ButtonDirection.vertical,
                          x: 395,
                          y: 20,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("P", startLabel += 25, 10),
                          direction: ButtonDirection.vertical,
                          x: 340,
                          y: 295,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("E", startLabel += 10, 6),
                          direction: ButtonDirection.horizontal,
                          x: 160,
                          y: 556,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("E", startLabel += 6, 3),
                          direction: ButtonDirection.horizontal,
                          x: 245,
                          y: 610,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("E", startLabel += 3, 3),
                          direction: ButtonDirection.vertical,
                          x: 330,
                          y: 645,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("E", startLabel += 3, 4),
                          direction: ButtonDirection.vertical,
                          x: 220,
                          y: 645,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("E", startLabel += 4, 4),
                          direction: ButtonDirection.vertical,
                          x: 140,
                          y: 645,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("E", startLabel += 4, 5),
                          direction: ButtonDirection.vertical,
                          x: 80,
                          y: 647,
                          updateCallback: updateCallback),
                      generatePositionedButtons(
                          labels: generateLabels("E", startLabel += 5, 8),
                          direction: ButtonDirection.vertical,
                          x: 10,
                          y: 560,
                          updateCallback: updateCallback),

                      // Edificio CNC
                      Positioned(
                        left: 40,
                        top: 305,
                        child: Container(
                          height: 200,
                          width: 295,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(168, 169, 171, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                            child: Text("CNC",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),

                      // Entrada secundaria
                      Positioned(
                        left: 350,
                        top: 0,
                        child: Container(
                          height: 20,
                          width: 65,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(168, 169, 171, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Center(
                            child: Text("Entrada",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),

                      // Entrada principal
                      Positioned(
                        left: 325,
                        top: 770,
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(168, 169, 171, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
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

  Widget visualizarInformacionCompta() {
    return informacionCompra();
  }
}
