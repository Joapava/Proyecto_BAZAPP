import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prueba/Class/noticias_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class agregar_noticia extends StatefulWidget {
  const agregar_noticia({super.key});

  @override
  State<agregar_noticia> createState() => _agregar_noticiaState();
}

class _agregar_noticiaState extends State<agregar_noticia> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cuerpoController = TextEditingController();
  String? _imagenUrlNoticia;
  String _nombreUsuario = '';
  bool isPickingImage = false;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nombreUsuario = prefs.getString('nombre') ?? '';
    });
  }

  Future<void> _pickImage() async {
    if (isPickingImage) return;

    setState(() {
      isPickingImage = true;
    });

    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        File imageFile = File(image.path);
        String fileName =
            'Noticias/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        String downloadURL =
            await FirebaseStorage.instance.ref(fileName).getDownloadURL();
        setState(() {
          _imagenUrlNoticia = downloadURL;
        });
      }
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      setState(() {
        isPickingImage = false;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _imagenUrlNoticia != null) {
      Navigator.pop(
          context,
          Noticia(
              '', _nombreUsuario, _cuerpoController.text, _imagenUrlNoticia!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _cuerpoController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Cuerpo de la noticia',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el cuerpo de la noticia';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: _imagenUrlNoticia == null
                        ? ElevatedButton.icon(
                            onPressed: _pickImage,
                            icon: const Icon(Icons.image, color: Colors.black),
                            label: const Text('Seleccionar Imagen',
                                style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(168, 169, 171, 0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _imagenUrlNoticia!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _submitForm,
                    icon: const Icon(Icons.send, color: Colors.black),
                    label: const Text('Agregar Noticia',
                        style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(168, 169, 171, 0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cuerpoController.dispose();
    super.dispose();
  }
}
