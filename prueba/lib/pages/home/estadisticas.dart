import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prueba/Persistencia/DatosDB.dart'; // Asegúrate de importar tu archivo de datos

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

  @override
  void initState() {
    super.initState();
    _loadImages();
    _loadRecentTransactions();
    _loadTotalVentas();
    _loadAvailableSpaces();
  }

  Future<void> _loadImages() async {
    try {
      ListResult result =
          await FirebaseStorage.instance.ref('uploads').listAll();
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
      List<Map<String, dynamic>> transactions =
          await DatosDB().getRecentTransactions();
      if (mounted) {
        setState(() {
          _recentTransactions = transactions;
        });
      }
    } catch (e) {
      print('Error loading transactions: $e');
    }
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
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        File imageFile = File(image.path);
        String fileName =
            'uploads/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        String downloadURL =
            await FirebaseStorage.instance.ref(fileName).getDownloadURL();
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
      backgroundColor: const Color.fromRGBO(250, 250, 250, .98),
      appBar: AppBar(
        title: const Text('Estadisticas bazar'),
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
            _buildStatCard(
                'Ventas del dia', '$_totalVentas', Icons.monetization_on),
            _buildStatCard(
                'Espacios disponibles', '$_availableSpaces', Icons.storage),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon) {
    return Card(
      color: const Color.fromRGBO(250, 250, 250, .98),
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
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestTransactions(BuildContext context) {
    _recentTransactions.sort((a, b) {
      // Ordenar por fecha primero
      DateTime dateA = DateFormat('dd/MM/yyyy').parse(a['fecha']);
      DateTime dateB = DateFormat('dd/MM/yyyy').parse(b['fecha']);
      int compare = dateB.compareTo(dateA);
      if (compare != 0) {
        return compare;
      }
      // Si las fechas son iguales, ordenar por hora
      int timeAMinutes = _timeOfDayToMinutes(a['hora']);
      int timeBMinutes = _timeOfDayToMinutes(b['hora']);
      return timeBMinutes.compareTo(timeAMinutes);
    });

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: const Color.fromRGBO(250, 250, 250, .98),
        child: Column(
          children: [
            const ListTile(
              title: Center(child: Text('Latest Transactions')),
              // trailing: Icon(Icons.more_vert), // Quitar el icono de tres puntos
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
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        _imageUrls.isNotEmpty
                            ? _imageUrls[index % _imageUrls.length]
                            : 'https://via.placeholder.com/150',
                      ),
                    ),
                    title: Text(transaction['nombre'] ?? 'Transaction $index'),
                    subtitle: Text(
                        'Fecha: ${transaction['fecha']}, ${transaction['hora']}'),
                    trailing: Text('-\$${transaction['total']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _timeOfDayToMinutes(String time) {
    int hours = int.parse(time.split(':')[0]);
    int minutes = int.parse(time.split(':')[1].split(' ')[0]);
    String period = time.split(' ')[1];

    if (period == 'PM' && hours != 12) {
      hours += 12;
    }
    if (period == 'AM' && hours == 12) {
      hours = 0;
    }

    return hours * 60 + minutes;
  }
}
