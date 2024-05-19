import 'package:flutter/material.dart';
import 'package:prueba/components/generar_botones.dart';

class InformacionBarraCompra extends StatelessWidget {
  const InformacionBarraCompra({super.key});

  @override
  Widget build(BuildContext context) {
    return informacionCompra();
  }
}

Widget informacionCompra() {
  int totalSelected = selectedLocations.length;
  int totalPrice = totalSelected * 200;

  return Positioned(
    top: 560,
    left: 10,
    child: Container(
      width: 430,
      height: 200,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(168, 169, 171, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total lugares seleccionados: $totalSelected',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Costo total: $totalPrice pesos',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lugares seleccionados:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedLocations
                      .map((location) =>
                          Text(location, style: const TextStyle(fontSize: 16)))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
