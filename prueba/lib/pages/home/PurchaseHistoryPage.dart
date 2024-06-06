import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importar el paquete intl para el formato de fecha
import 'package:cloud_firestore/cloud_firestore.dart'; // Importar Firestore para manejar los Timestamps
import 'package:prueba/generated/l10n.dart';

class PurchaseHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> purchaseHistory;

  PurchaseHistoryPage({required this.purchaseHistory});

  @override
  Widget build(BuildContext context) {
    // Agrupar compras por id_compra
    var groupedPurchases = _groupPurchasesByTransaction(purchaseHistory);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        title: Text(S.current.shopping_history_title),
      ),
      body: ListView.builder(
        itemCount: groupedPurchases.length,
        itemBuilder: (context, index) {
          var transaction = groupedPurchases[index];
          var timestamp = transaction['fecha_compra'] as Timestamp;
          var dateTime = timestamp.toDate().toLocal(); // Convertir a hora local
          var formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);

          return ListTile(
            title: Text(
              '${S.current.shopping_history_label_1} ${transaction['id_espacios'].join(', ')}',
              style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${S.current.shopping_history_label_2} $formattedDate',
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 16)),
                Text(
                    '${S.current.shopping_history_label_3} \$${transaction['precio_total']}',
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 16)),
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
      // Verificar que los campos necesarios no sean nulos
      if (purchase['id_compra'] == null ||
          purchase['fecha_compra'] == null ||
          purchase['id_espacio'] == null) {
        print("Warning: Missing required fields in purchase: $purchase");
        continue; // Saltar esta compra si faltan campos necesarios
      }

      // Usar id_compra como clave única
      String key = purchase['id_compra'];

      if (!grouped.containsKey(key)) {
        grouped[key] = {
          'id_espacios': [],
          'fecha_compra': purchase['fecha_compra'],
          'precio_total':
              purchase['precio_total'] ?? 0.0, // Manejar precio_total null
        };
      }
      grouped[key]!['id_espacios'].add(purchase['id_espacio']);
    }

    return grouped.values.toList();
  }
}
