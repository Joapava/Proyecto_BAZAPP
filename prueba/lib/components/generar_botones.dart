import 'package:flutter/material.dart';

// Define una enumeración para la dirección de los botones.
enum ButtonDirection { horizontal, vertical }

// Función para generar botones y posicionarlos.
Widget generatePositionedButtons({
  required int count,
  required ButtonDirection direction,
  required String startingLabel,
  required double x,
  required double y,
}) {
  List<Widget> buttons = List.generate(count, (index) {
    return Container(
      height: 20,
      width: 20,
      margin: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: () => print("Botón $startingLabel$index presionado"),
        child: FittedBox( // Asegura que el texto se ajuste al espacio disponible
          child: Text(
            "$startingLabel$index",
            style: const TextStyle(fontSize: 12), // Puedes ajustar el tamaño del texto aquí
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // Reduce el padding a cero
          shape: RoundedRectangleBorder( // Asegura que el botón sea cuadrado
            borderRadius: BorderRadius.circular(3), // Ajusta la curvatura de las esquinas
          ),
        ),
      ),
    );
  });

  return Positioned(
    left: x,
    top: y,
    child: direction == ButtonDirection.horizontal ? Row(children: buttons) : Column(children: buttons),
  );
}
