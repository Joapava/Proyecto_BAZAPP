import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importar el paquete intl para el formato de fecha
import 'package:cloud_firestore/cloud_firestore.dart'; // Importar Firestore para manejar los Timestamps

class PurchaseHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> purchaseHistory;

  PurchaseHistoryPage({required this.purchaseHistory});

  @override
  Widget build(BuildContext context) {
    // Agrupar compras por id_compra
    var groupedPurchases = _groupPurchasesByTransaction(purchaseHistory);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Compras'),
      ),
      body: ListView.builder(
        itemCount: groupedPurchases.length,
        itemBuilder: (context, index) {
          var transaction = groupedPurchases[index];
          var timestamp = transaction['fecha_compra'] as Timestamp;
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

  List<Map<String, dynamic>> _groupPurchasesByTransaction(List<Map<String, dynamic>> purchases) {
    Map<String, Map<String, dynamic>> grouped = {};

    for (var purchase in purchases) {
      // Verificar que los campos necesarios no sean nulos
      if (purchase['id_compra'] == null || purchase['fecha_compra'] == null || purchase['id_espacio'] == null) {
        print("Warning: Missing required fields in purchase: $purchase");
        continue; // Saltar esta compra si faltan campos necesarios
      }

      // Usar id_compra como clave única
      String key = purchase['id_compra'];

      if (!grouped.containsKey(key)) {
        grouped[key] = {
          'id_espacios': [],
          'fecha_compra': purchase['fecha_compra'],
          'precio_total': purchase['precio_total'] ?? 0.0, // Manejar precio_total null
        };
      }
      grouped[key]!['id_espacios'].add(purchase['id_espacio']);
    }

    return grouped.values.toList();
  }
}