import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/components/generar_botones.dart';
import 'package:prueba/generated/l10n.dart';

class InformacionBarraCompra extends StatelessWidget {
  final Preferencias perfs;
  const InformacionBarraCompra({super.key, required this.perfs});

  @override
  Widget build(BuildContext context) {
    return informacionCompra(perfs);
  }
}

Widget informacionCompra(Preferencias prefs) {

  int totalSelected = selectedLocations.length;
  int totalPrice = totalSelected * prefs.price;
  return Container(
    width:
        550, // Aseguramos que el ancho sea el mismo que el contenedor de puestos
    height: 330,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(168, 169, 171, 0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shopping_cart, color: Colors.black54),
              const SizedBox(width: 10),
              Text(
                S.current.locate_resume_buy,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Text(S.current.locate_information('${prefs.price}'), style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          const Divider(color: Colors.black54),
          Text(
            '${S.current.locate_total} $totalSelected',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '${S.current.locate_total_cost} $totalPrice pesos',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            S.current.locate_selected_spaces,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                spacing: 8.0, // Espacio horizontal entre los elementos
                runSpacing: 4.0, // Espacio vertical entre las filas
                children: _buildLocationTexts(selectedLocations),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

List<Widget> _buildLocationTexts(List<String> locations) {
  List<Widget> locationWidgets = [];
  for (int i = 0; i < locations.length; i++) {
    locationWidgets.add(
      Chip(
        label: Text(
          locations[i],
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
  return locationWidgets;
}
