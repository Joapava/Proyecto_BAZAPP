import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prueba/Class/Expositor.dart';
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuAdmin extends StatefulWidget {
  const MenuAdmin({super.key});

  @override
  State<MenuAdmin> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  List<String> _imageUrls = [];
  List<Map<String, dynamic>> _recentTransactions = [];
  int _totalVentas = 0;
  int _availableSpaces = 0;
  List<Expositor> _expositores = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
    _loadRecentTransactions();
    _loadTotalVentas();
    _loadAvailableSpaces();
    _loadExpositores();
  }

  Future<void> _loadExpositores() async {
    try {
      List<Expositor> expositores = await DatosDB().getExpositores();
      if (mounted) {
        setState(() {
          _expositores = expositores;
        });
      }
    } catch (e) {
      print('Error loading expositores: $e');
    }
  }

  Future<void> _loadImages() async {
    try {
      ListResult result = await FirebaseStorage.instance.ref('uploads').listAll();
      List<String> urls = [];
      for (var ref in result.items) {
        String url = await ref.getDownloadURL();
        urls.add(url);
      }
      if (mounted) {
        setState(() {
          _imageUrls = urls;
        });
      }
    } catch (e) {
      print('Error loading images: $e');
    }
  }

  Future<void> _loadRecentTransactions() async {
    try {
      List<Map<String, dynamic>> transactions = await DatosDB().getRecentTransactions();
      if (mounted) {
        setState(() {
          _recentTransactions = transactions;
          _recentTransactions = _groupTransactionsByCompra(_recentTransactions);
        });
      }
    } catch (e) {
      print('Error loading transactions: $e');
    }
  }

  List<Map<String, dynamic>> _groupTransactionsByCompra(List<Map<String, dynamic>> transactions) {
    Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

    for (var transaction in transactions) {
      String idCompra = transaction['id_compra'];
      if (!groupedTransactions.containsKey(idCompra)) {
        groupedTransactions[idCompra] = [];
      }
      groupedTransactions[idCompra]!.add(transaction);
    }

    return groupedTransactions.values.map((group) {
      var firstTransaction = group.first;
      firstTransaction['espacios_comprados'] = group.map((t) => t['id_espacio']).toList();
      return firstTransaction;
    }).toList();
  }

  Future<void> _loadTotalVentas() async {
    try {
      int totalVentas = await DatosDB().getTotalVentas();
      if (mounted) {
        setState(() {
          _totalVentas = totalVentas;
        });
      }
    } catch (e) {
      print('Error loading total ventas: $e');
    }
  }

  Future<void> _loadAvailableSpaces() async {
    try {
      int availableSpaces = await DatosDB().getAvailableSpacesCount();
      if (mounted) {
        setState(() {
          _availableSpaces = availableSpaces;
        });
      }
    } catch (e) {
      print('Error loading available spaces: $e');
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        File imageFile = File(image.path);
        String fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        String downloadURL = await FirebaseStorage.instance.ref(fileName).getDownloadURL();
        if (mounted) {
          setState(() {
            _imageUrls.add(downloadURL);
          });
        }
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas Bazar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildStatisticsCards(context),
            _buildLatestTransactions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard('Ventas del día', '$_totalVentas', Icons.monetization_on),
            _buildStatCard('Espacios disponibles', '$_availableSpaces', Icons.storage),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40.0),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              count,
              style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestTransactions(BuildContext context) {
    _recentTransactions.sort((a, b) {
      // Convertir Timestamp a DateTime
      DateTime dateA = (a['fecha_compra'] as Timestamp).toDate();
      DateTime dateB = (b['fecha_compra'] as Timestamp).toDate();
      
      // Comparar fechas directamente
      return dateB.compareTo(dateA);
    });

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          children: [
            const ListTile(
              title: Center(child: Text('Latest Transactions')),
            ),
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _recentTransactions.length,
                itemBuilder: (context, index) {
                  var transaction = _recentTransactions[index];
                  String expositorId = transaction['id_expositor'];
                  DateTime fechaCompra = (transaction['fecha_compra'] as Timestamp).toDate();
                  String fechaFormateada = DateFormat('dd/MM/yyyy HH:mm').format(fechaCompra);

                  Expositor? expositor;
                  try {
                    expositor = _expositores.firstWhere((expositor) => expositor.id == expositorId);
                  } catch (e) {
                    expositor = null;
                  }

                  String expositorNombreCompleto = expositor != null
                      ? '${expositor.nombre} ${expositor.apellidos}'
                      : 'Expositor no encontrado';

                  List<String> espaciosComprados = List<String>.from(transaction['espacios_comprados'] ?? []);

                  return ListTile(
                    title: Text(expositorNombreCompleto),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fecha: $fechaFormateada'),
                        Text('Espacios: ${espaciosComprados.join(", ")}'),
                      ],
                    ),
                    trailing: Text('+\$${transaction['precio_total']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
