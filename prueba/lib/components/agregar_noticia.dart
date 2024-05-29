import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        File imageFile = File(image.path);
        String fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        String downloadURL = await FirebaseStorage.instance.ref(fileName).getDownloadURL();
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
      Navigator.pop(context, {
        'nombre': _nombreUsuario,
        'cuerpo': _cuerpoController.text,
        'imagenUrl': _imagenUrlNoticia,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Noticia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
              
                TextFormField(
                  controller: _cuerpoController,
                  decoration: const InputDecoration(labelText: 'Cuerpo de la noticia'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el cuerpo de la noticia';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _imagenUrlNoticia == null
                    ? ElevatedButton(
                        onPressed: _pickImage,
                        child: const Text('Seleccionar Imagen'))
                    : Image.network(_imagenUrlNoticia!),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Agregar Noticia'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
