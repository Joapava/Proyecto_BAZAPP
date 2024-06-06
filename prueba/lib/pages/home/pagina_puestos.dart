import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/components/generar_botones.dart';
import 'package:prueba/components/informacion_compra_puesto.dart';
import 'package:prueba/generated/l10n.dart';

class PaginaPuestos extends StatefulWidget {
  const PaginaPuestos({super.key});

  @override
  State<PaginaPuestos> createState() => _PaginaPuestosState();
}

class _PaginaPuestosState extends State<PaginaPuestos> {
  void updateState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializePurchasedLocations();
  }
// GUARDAR COMPRAS

  Future<void> initializePurchasedLocations() async {
    await Preferencias.init();
    List<String> allOccupiedLocations =
        await DatosDB().getAllOccupiedLocations();

    setState(() {
      purchasedLocations = allOccupiedLocations;
    });
  }

  // Función para generar etiquetas únicas con letras y números consecutivos
  List<String> generateLabels(String letter, int start, int count) {
    return List<String>.generate(
        count, (index) => '$letter${start + index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, .98),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    significadoColorPuesto(),
                    const SizedBox(height: 10),
                    contenedorPuestos(updateState, constraints.maxWidth,
                        constraints.maxHeight),
                    const SizedBox(height: 10),
                    visualizarInformacionCompta(),
                    const SizedBox(height: 10),
                    if (selectedLocations.isNotEmpty)
                      ElevatedButton(
                        onPressed: () async {
                          await Preferencias.init();
                          String expositorId = Preferencias().id;
                          int total = selectedLocations.length * 200;

                          // Guardar la compra en la colección "compra"
                          await DatosDB().saveCompra(expositorId, total);

                          // Guardar las ubicaciones compradas en la colección "registroEspacio"
                          await DatosDB().savePurchasedLocations(
                              selectedLocations, expositorId);

                          // Actualizar el estado de los botones a gris (ocupado)
                          setState(() {
                            for (var label in selectedLocations) {
                              purchasedLocations.add(label);
                            }
                            selectedLocations.clear();
                          });
                        },
                        child: const Text('Comprar',
                            style: TextStyle(color: Colors.black)),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget contenedorPuestos(
      Function updateCallback, double maxWidth, double maxHeight) {
    int startLabel = 0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: const Color.fromRGBO(168, 169, 171, 0.2),
        border: Border.all(color: Colors.grey),
      ),
      child: SizedBox(
        height: maxHeight - 250,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 0.1,
              maxScale: 2.0,
              child: SizedBox(
                width: 500, // Ajustar este valor según sea necesario
                height: 830, // Ajustar este valor según sea necesario
                child: Stack(
                  children: [
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
                        child: Center(
                          child: Text(S.of(context).locate_entry,
                              style: const TextStyle(
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
                        child: Center(
                          child: Text(S.of(context).locate_entry,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget visualizarInformacionCompta() {
  return informacionCompra();
}

Widget significadoColorPuesto() {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color.fromARGB(184, 1, 167, 62),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Text(S.current.locate_indication_1)
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color.fromARGB(184, 255, 11, 11),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Text(S.current.locate_indication_2)
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(168, 169, 171, 0.2),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Text(S.current.locate_indication_3)
          ],
        ),
      ],
    ),
  );
}
