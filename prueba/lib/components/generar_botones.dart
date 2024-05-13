import 'package:flutter/material.dart';
import 'package:prueba/pages/pagina_puestos%20copy.dart';

// Define una enumeración para la dirección de los botones.
enum ButtonDirection { horizontal, vertical }

// Variable global para mantener el contador.
int globalCounter = 1;

class ButtonWithColorChange extends StatefulWidget {
  final String label;

  const ButtonWithColorChange({Key? key, required this.label})
      : super(key: key);

  @override
  _ButtonWithColorChangeState createState() => _ButtonWithColorChangeState();
}

class _ButtonWithColorChangeState extends State<ButtonWithColorChange> {
  bool isPressed = false;

  void _toggleColor() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      margin: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: _toggleColor,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPressed
              ? const Color.fromARGB(184, 255, 11, 11)
              : const Color.fromARGB(185, 9, 152, 255),
          padding: EdgeInsets.zero, // Reduce el padding a cero
          shape: RoundedRectangleBorder(
            // Asegura que el botón sea cuadrado
            borderRadius:
                BorderRadius.circular(3), // Ajusta la curvatura de las esquinas
          ),
        ),
        child: FittedBox(
          // Asegura que el texto se ajuste al espacio disponible
          child: Text(
            widget.label,
            style: const TextStyle(
                fontSize: 10, color: Colors.black), // Puedes ajustar el tamaño del texto aquí
          ),
        ),
      ),
    );
  }
}

// Función para generar botones y posicionarlos.
Widget generatePositionedButtons({
  required int count,
  required ButtonDirection direction,
  required String startingLabel,
  required double x,
  required double y,
}) {
  List<Widget> buttons = List.generate(count, (index) {
    return ButtonWithColorChange(label: '$startingLabel${globalCounter++}');
  });

  return Positioned(
    left: x,
    top: y,
    child: direction == ButtonDirection.horizontal
        ? Row(children: buttons)
        : Column(children: buttons),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PaginaPuestos(),
    );
  }
}
