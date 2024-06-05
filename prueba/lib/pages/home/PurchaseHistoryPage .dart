import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importar el paquete intl para el formato de fecha

class PurchaseHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> purchaseHistory;

  PurchaseHistoryPage({required this.purchaseHistory});

  @override
  Widget build(BuildContext context) {
    // Agrupar compras por fecha de compra y precio total
    var groupedPurchases = _groupPurchasesByTransaction(purchaseHistory);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Compras'),
      ),
      body: ListView.builder(
        itemCount: groupedPurchases.length,
        itemBuilder: (context, index) {
          var transaction = groupedPurchases[index];
          var timestamp = transaction['fecha_compra'];
          var dateTime = timestamp.toDate().toLocal(); // Convertir a hora local
          var formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);

          return ListTile(
            title: Text('Lugares: ${transaction['id_espacios'].join(', ')}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fecha: $formattedDate'),
                Text('Precio Total: \$${transaction['precio_total']}'),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _groupPurchasesByTransaction(
      List<Map<String, dynamic>> purchases) {
    Map<String, Map<String, dynamic>> grouped = {};

    for (var purchase in purchases) {
      String key =
          '${purchase['fecha_compra']}_${purchase['precio_total']}'; // Crear una clave única por transacción

      if (!grouped.containsKey(key)) {
        grouped[key] = {
          'id_espacios': [],
          'fecha_compra': purchase['fecha_compra'],
          'precio_total': purchase['precio_total'],
        };
      }
      grouped[key]!['id_espacios'].add(purchase['id_espacio']);
    }

    return grouped.values.toList();
  }
}
