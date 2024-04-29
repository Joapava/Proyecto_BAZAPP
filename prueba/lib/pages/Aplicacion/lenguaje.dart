import 'package:flutter/material.dart';

class Lenguaje extends StatefulWidget {
  const Lenguaje({super.key});

  @override
  State<Lenguaje> createState() => _LenguajeState();
}

class _LenguajeState extends State<Lenguaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: SingleChildScrollView(child: principal(),),
      ),
    );
  }

  Widget principal() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: FittedBox(
            child: Text(
              'Seleccionar idioma',
              style: TextStyle(fontFamily: 'Inter', fontSize: 20),
            ),
          ),
        ),
        buttonregreso(),
        busqueda(),
        idiomas()
      ],
    );
  }

  Widget busqueda() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 270,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(240, 240, 240, 1)),
          child: Row(
            children: [
              SizedBox(
                width: 270,
                height: 30,
                child: Form(
                    child: TextFormField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsetsDirectional.all(6),
                      hintText: 'Buscar',
                      prefixIcon: Icon(Icons.search),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
                )),
              )
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Cancelar',
              style: TextStyle(
                  fontFamily: 'Inter', fontSize: 18, color: Colors.black),
            ))
      ],
    );
  }

  Widget idiomas() {
    return Container(
        width: 350,
        height: 700,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 35,
              child: FloatingActionButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                elevation: 0,
                child: const Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 290,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.translate_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            'Lenguaje',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Color.fromRGBO(109, 106, 106, 1)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            ' (español)',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                                color: Color.fromRGBO(179, 179, 179, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              ),
              
            )
          ],
        ));
  }

  Widget buttonregreso() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 40,
          height: 40,
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

  @override
  void dispose() {
    super.dispose();
  }
}
