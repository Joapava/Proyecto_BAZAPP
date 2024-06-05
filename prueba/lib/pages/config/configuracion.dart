import 'package:flutter/material.dart';
import 'package:prueba/Negocio/autenticar.dart';
import 'package:prueba/Persistencia/DatosDB.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/pages/config/Application/lenguaje.dart';
import 'package:prueba/pages/config/Application/notificaciones.dart';
import 'package:prueba/pages/config/Account/password.dart';
import 'package:prueba/pages/config/Account/perfil.dart';
import 'package:prueba/pages/config/Politicas/politicas.dart';
import 'package:prueba/pages/config/Politicas/terminos.dart';
import 'package:prueba/pages/Login/login.dart';
import 'package:prueba/pages/home/PurchaseHistoryPage%20.dart';

class Configuracion extends StatefulWidget {
  const Configuracion({super.key});

  @override
  State<Configuracion> createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  final perfs = Preferencias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: principal(),
        ),
      ),
    );
  }

  Widget principal() {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Center(
            child: FittedBox(
              child: Text(
                'Ajustes',
                style: TextStyle(
                    fontFamily: 'Inter', fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 30),
          heat(),
          const SizedBox(height: 20),
          Container_aplicacion(),
          const SizedBox(height: 15),
          Container_cuenta(),
          const SizedBox(height: 15),
          Container_politica(),
          const SizedBox(height: 25),
          Container_historial_compras(),
          const SizedBox(height: 25),
          Container(
            width: 400,
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: FloatingActionButton(
              heroTag: 'exit',
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              onPressed: () {
                String x = perfs.type;
                perfs.clear();
                if (x == "email") Autenticar().singout();
                if (x == "google") Autenticar().singoutgoogle();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Center(
                child: FittedBox(
                  child: Text(
                    'Cerrar Sesion',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container Container_historial_compras() {
    return Container(
      width: 400,
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: FloatingActionButton(
        heroTag: 'historial_compras',
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        onPressed: () async {
          var expositorId = perfs.id;
          var purchaseHistory = await DatosDB().getPurchaseHistory(expositorId);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PurchaseHistoryPage(purchaseHistory: purchaseHistory),
            ),
          );
        },
        child: const Row(
          children: [
            SizedBox(width: 35),
            Icon(Icons.history, color: Colors.black),
            SizedBox(width: 10),
            FittedBox(
              child: Text(
                'Historial de Compras',
                style: TextStyle(
                    fontFamily: 'Inter', fontSize: 18, color: Colors.black),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  Container Container_politica() {
    return Container(
      width: 400,
      height: 102,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 15),
              FittedBox(
                child: Text(
                  'Politica, Terminos y Condiciones',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 35,
            child: FloatingActionButton(
              heroTag: 'politica_p',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Politicas()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: const Row(
                children: [
                  SizedBox(width: 35),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.edit_document, color: Colors.black),
                        SizedBox(width: 5),
                        FittedBox(
                          child: Text(
                            'Politica de Privacidad',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.black)
                ],
              ),
            ),
          ),
          SizedBox(
              width: 400,
              height: 40,
              child: FloatingActionButton(
                heroTag: 'terminos',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Terminos()));
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                elevation: 0,
                child: const Row(
                  children: [
                    SizedBox(width: 35),
                    SizedBox(
                      width: 320,
                      height: 35,
                      child: Row(
                        children: [
                          Icon(Icons.edit_document, color: Colors.black),
                          SizedBox(width: 5),
                          FittedBox(
                            child: Text(
                              'Terminos y Condiciones',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.black)
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Container Container_cuenta() {
    return Container(
      height: 96,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 15),
              FittedBox(
                child: Text(
                  'Cuenta',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 35,
            child: FloatingActionButton(
              heroTag: 'perfil',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Perfil(perfs: perfs)));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: const Row(
                children: [
                  SizedBox(width: 35),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.person_2_sharp, color: Colors.black),
                        SizedBox(width: 5),
                        FittedBox(
                          child: Text(
                            'Perfil',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.black)
                ],
              ),
            ),
          ),
          SizedBox(
            width: 400,
            height: 35,
            child: FloatingActionButton(
              heroTag: 'password',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Password()));
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: const Row(
                children: [
                  SizedBox(width: 35),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.lock_person, color: Colors.black),
                        SizedBox(width: 5),
                        FittedBox(
                          child: Text(
                            'Contraseña',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.black)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container Container_aplicacion() {
    return Container(
      height: 110,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 15),
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
            child: FloatingActionButton(
              heroTag: 'lenguaje',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Lenguaje(perfs: perfs)));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: const Row(
                children: [
                  SizedBox(width: 35),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.translate_outlined, color: Colors.black),
                        SizedBox(width: 5),
                        FittedBox(
                          child: Text(
                            'Lenguaje',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.black)
                ],
              ),
            ),
          ),
          const Divider(
            height: .5,
            color: Color.fromRGBO(234, 234, 234, 1),
          ),
          SizedBox(
            width: 400,
            height: 44,
            child: FloatingActionButton(
              heroTag: 'notificacion',
              onPressed: () {
                perfs.variable = perfs.notificaciones;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notificaciones()));
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: const Row(
                children: [
                  SizedBox(width: 35),
                  SizedBox(
                    height: 35,
                    width: 320,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.black),
                        SizedBox(width: 5),
                        FittedBox(
                          child: Text(
                            'Notificaciones',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.black)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget heat() {
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(width: 25),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.amber),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  perfs.nombre,
                  style: const TextStyle(
                      fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                ),
              ),
              FittedBox(
                child: Text(
                  perfs.email,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Color.fromRGBO(88, 88, 88, 1)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
