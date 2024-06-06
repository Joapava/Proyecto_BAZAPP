import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prueba/Class/noticias_data.dart';
import 'package:prueba/generated/l10n.dart';
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

  // colocar los metodos en las capas correspondientes
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
            'noticias/${DateTime.now().millisecondsSinceEpoch}.jpg';
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
          '',
          '',
          _nombreUsuario,
          _cuerpoController.text,
          _imagenUrlNoticia!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return  Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, .98),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: altura * .06,
              ),
              regreso(),
              SizedBox(
                height: altura * .035,
              ),
              Center(
                child: Container(
                  height: altura * .33,
                  width: ancho * .8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: altura * .01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: ancho * .1,
                          ),
                          SizedBox(
                            width: ancho * .5,
                            child: Text(
                              S.of(context).news_title,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: ancho * .1,
                          ),
                          SizedBox(
                            width: ancho * .064,
                            height: altura * .032,
                            child: FloatingActionButton(
                              heroTag: 'deletedata',
                              onPressed: () {
                                setState(() {
                                  _cuerpoController.text = "";
                                  _imagenUrlNoticia = null;
                                });
                              },
                              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                              elevation: 0,
                              child: Icon(
                                Icons.close,
                                color: Colors.grey[700],
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        endIndent: ancho * .02,
                        indent: ancho * .02,
                      ),
                      cuerponoticia(),
                      SizedBox(
                        height: altura * .01,
                      ),
                      Divider(
                        endIndent: ancho * .02,
                        indent: ancho * .02,
                      ),
                      Row(
                        children: [
                          addimage(),
                          SizedBox(
                            width: ancho * .17,
                          ),
                          postnew()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      );
  }

  Widget regreso() {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          width: ancho * .025,
        ),
        SizedBox(
          width: ancho * .07,
          height: altura * .03,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            elevation: 0,
            child: Image.asset('assets/arrow-back.png'),
          ),
        ),
      ],
    );
  }

  Widget postnew() {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Container(
      width: ancho * .15,
      height: altura * .032,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromRGBO(236, 119, 46, 1)),
      child: FloatingActionButton(
        onPressed: () {
          _submitForm();
        },
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        child: Text(
          S.of(context).news_post,
          style: const TextStyle(fontFamily: 'Inter', color: Colors.white),
        ),
      ),
    );
  }

  Widget addimage() {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return SizedBox(
      width: ancho * .45,
      child: Row(
        children: [
          SizedBox(
            width: ancho * .03,
          ),
          _imagenUrlNoticia == null
              ? SizedBox(
                  height: altura * .032,
                  width: ancho * .10,
                  child: FloatingActionButton(
                    heroTag: 'pickimage',
                    onPressed: () {
                      _pickImage();
                    },
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                    child: Image.asset('assets/pick-image.png'),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _imagenUrlNoticia!,
                    height: altura * .1,
                    width: ancho * .4,
                    fit: BoxFit.cover,
                  ),
                ),
        ],
      ),
    );
  }

  Widget cuerponoticia() {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return SizedBox(
      width: ancho * .73,
      height: altura * .14,
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _cuerpoController,
          maxLines: 5,
          decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: S.of(context).news_body,
              focusedBorder: InputBorder.none,
              border: InputBorder.none),
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Inter',
            fontSize: 15,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).news_error;
            }
            return null;
          },
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
