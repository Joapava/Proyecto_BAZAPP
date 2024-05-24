// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prueba/Negocio/EditarDatos.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

class Notificaciones extends StatefulWidget {
  const Notificaciones({super.key});

  @override
  State<Notificaciones> createState() => _Notificaciones();
}

class _Notificaciones extends State<Notificaciones> {
  final perfs = Preferencias();
  bool npush = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(child: SingleChildScrollView(child: principal())),
    );
  }

  Widget principal() {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Center(
          child: FittedBox(
            child: Text(
              'Notificaciones',
              style: TextStyle(fontFamily: 'Inter', fontSize: 20),
            ),
          ),
        ),
        button_regreso(),
        const SizedBox(
          height: 25,
        ),
        toogle_buttom(),
      ],
    );
  }

  Container toogle_buttom() {
    return Container(
      width: 400,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              FittedBox(
                child: Text(
                  'Aplicacion',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                ),
              )
            ],
          ),
          SizedBox(
              width: 400,
              height: 35,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 300,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.notifications_active),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            'Notificaciones',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: perfs.notificaciones,
                    activeColor: const Color.fromRGBO(81, 126, 225, 1),
                    inactiveTrackColor: Colors.white,
                    onChanged: (bool value) {
                      setState(() {
                        perfs.notificaciones = value;
                      });
                    },
                  )
                ],
              )),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: 400,
              height: 35,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 300,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.messenger_sharp),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            'Notificaciones PUSH',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: npush,
                    activeColor: const Color.fromRGBO(81, 126, 225, 1),
                    inactiveTrackColor: Colors.white,
                    onChanged: (bool value) {
                      setState(() {
                        npush = value;
                      });
                    },
                  )
                ],
              )),
        ],
      ),
    );
  }

  Row button_regreso() {
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
              if(perfs.notificaciones != perfs.variable){
                EditarDatos().cambiarntf(perfs.notificaciones);
              }
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
}
