// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prueba/Negocio/EditarDatos.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/generated/l10n.dart';

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
        Center(
          child: FittedBox(
            child: Text(
              S.of(context).subtitle_app_noti,
              style: const TextStyle(fontFamily: 'Inter', fontSize: 20),
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
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              FittedBox(
                child: Text(
                  S.of(context).subtitle_box_app,
                  style: const TextStyle(
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
                  SizedBox(
                    width: 300,
                    height: 35,
                    child: Row(
                      children: [
                        const Icon(Icons.notifications_active),
                        const SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).subtitle_app_noti,
                            style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
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
