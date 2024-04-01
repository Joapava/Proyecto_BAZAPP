import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  // Esta función ayuda a generar una fila de 9 botones
  Widget filaDeBotones() {
    List<Widget> botones = List.generate(9, (index) {
      return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 1, 0),
        child: SizedBox(
          width: 20,
          height: 20,
          child: ElevatedButton(
            onPressed: () {
              // Acción del botón
              print("Botón $index presionado");
            },
            child: Text(""), // El texto del botón
          ),
        ),
      );
    });

    return Row(
      //mainAxisAlignment: MainAxisAlignment.center, // Centrar los botones en la fila
      children: botones,
    );
  }

  // Lista de Widgets que vamos a generar, incluyendo filas de botones y espacios
  List<Widget> listaDeWidgets = [];

  // Generar el patrón específico: 2 filas de 9 botones, un espacio, repetir
  for (int i = 0; i < 3; i++) { // 3 grupos de 2 filas
    listaDeWidgets.add(filaDeBotones()); // Primera fila de 9 botones
    listaDeWidgets.add(filaDeBotones()); // Segunda fila de 9 botones

    if (i < 2) { // Añadir un espacio después de los primeros 2 grupos de filas
      listaDeWidgets.add(SizedBox(height: 20)); // Espacio entre los grupos de filas
    }
  }

  return Scaffold(
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        width: 450,
        // Ajustar la altura según sea necesario, o dejarla dinámica
        decoration: BoxDecoration(
          color: const Color.fromRGBO(168, 169, 171, 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Permite desplazamiento horizontal si es necesario
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar la columna verticalmente
            children: listaDeWidgets,
          ),
        ),
      ),
    ),
  );
}
