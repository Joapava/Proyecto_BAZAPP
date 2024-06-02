import 'package:flutter/material.dart';

// Define una enumeración para la dirección de los botones.
enum ButtonDirection { horizontal, vertical }

// Variable global para mantener los lugares seleccionados y comprados.
List<String> selectedLocations = [];
List<String> purchasedLocations = [];

class ButtonWithColorChange extends StatefulWidget {
  final String label;
  final Function updateCallback;

  const ButtonWithColorChange({
    Key? key,
    required this.label,
    required this.updateCallback,
  }) : super(key: key);

  @override
  _ButtonWithColorChangeState createState() => _ButtonWithColorChangeState();
}

class _ButtonWithColorChangeState extends State<ButtonWithColorChange> {
  bool isPressed = false;

  void _toggleColor() {
    setState(() {
      isPressed = !isPressed;
      if (isPressed) {
        selectedLocations.add(widget.label);
      } else {
        selectedLocations.remove(widget.label);
      }
      widget.updateCallback();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPurchased = purchasedLocations.contains(widget.label);

    return Tooltip(
      message: 'Espacio: 3x3',
      child: Container(
        height: 25,
        width: 25,
        margin: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: isPurchased ? null : _toggleColor,
          style: ElevatedButton.styleFrom(
            backgroundColor: isPurchased
                ? const Color.fromRGBO(168, 169, 171, 0.2)
                : (isPressed
                    ? const Color.fromARGB(184, 255, 11, 11)
                    : const Color.fromARGB(184, 1, 167, 62)),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          child: FittedBox(
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

// Función para generar botones y posicionarlos.
Widget generatePositionedButtons({
  required List<String> labels,
  required ButtonDirection direction,
  required double x,
  required double y,
  required Function updateCallback,
}) {
  List<Widget> buttons = List.generate(labels.length, (index) {
    final label = labels[index];
    return ButtonWithColorChange(
      label: label,
      updateCallback: updateCallback,
    );
  });

  return Positioned(
    left: x,
    top: y,
    child: direction == ButtonDirection.horizontal
        ? Row(children: buttons)
        : Column(children: buttons),
  );
}
