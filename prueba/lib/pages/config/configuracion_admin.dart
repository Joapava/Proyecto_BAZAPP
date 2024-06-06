import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/Auth.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/Persistencia/auth_google.dart';
import 'package:prueba/generated/l10n.dart';
import 'package:prueba/pages/config/Application/lenguaje.dart';
import 'package:prueba/pages/config/Application/notificaciones.dart';
import 'package:prueba/pages/config/Account/password.dart';
import 'package:prueba/pages/config/Account/perfil.dart';
import 'package:prueba/pages/config/Maintenance/chageprice.dart';
import 'package:prueba/pages/config/Politicas/politicas.dart';
import 'package:prueba/pages/config/Politicas/terminos.dart';
import 'package:prueba/pages/Login/login.dart';

class ConfiguracionAdmin extends StatefulWidget {
  const ConfiguracionAdmin({super.key});

  @override
  State<ConfiguracionAdmin> createState() => _ConfiguracionAdminState();
}

class _ConfiguracionAdminState extends State<ConfiguracionAdmin> {
  final perfs = Preferencias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, .98),
      body: SafeArea(
          child: SingleChildScrollView(
        child: principal(),
      )),
    );
  }

  Widget principal() {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Center(
            child: FittedBox(
              child: Text(
                S.of(context).tittle_settings,
                style: const TextStyle(
                    fontFamily: 'Inter', fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          heat(),
          const SizedBox(
            height: 20,
          ),
          Container_aplicacion(),
          const SizedBox(
            height: 15,
          ),
          Container_cuenta(),
          const SizedBox(
            height: 15,
          ),
          Container_crear(),
          const SizedBox(
            height: 15,
          ),
          Container_politica(),
          const SizedBox(
            height: 25,
          ),
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
                if (x == 'email') Auth().signOut();
                if (x == "google") Authgoole().singout();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Center(
                child: FittedBox(
                  child: Text(
                    S.of(context).title_signout,
                    style: const TextStyle(
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

  Container Container_politica() {
    return Container(
      width: 400,
      height: 102,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              FittedBox(
                child: Text(
                  S.of(context).subtitle_box_policy,
                  style: const TextStyle(
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
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        const Icon(Icons.edit_document, color: Colors.black),
                        const SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).subtitle_policy_privacy,
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.black)
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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    SizedBox(
                      width: 320,
                      height: 35,
                      child: Row(
                        children: [
                          const Icon(Icons.edit_document, color: Colors.black),
                          const SizedBox(
                            width: 5,
                          ),
                          FittedBox(
                            child: Text(
                              S.of(context).subtitle_policy_term,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.black)
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
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              FittedBox(
                child: Text(
                  S.of(context).subtitle_box_account,
                  style: const TextStyle(
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
                        builder: (context) => Perfil(
                              perfs: perfs,
                            )));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        const Icon(Icons.person_2_sharp, color: Colors.black),
                        const SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).subtitle_account_profile,
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.black)
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
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        const Icon(Icons.lock_person, color: Colors.black),
                        const SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).subtitle_account_password,
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.black)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container Container_crear() {
    return Container(
      height: 96,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              FittedBox(
                child: Text(
                  'Generar',
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
              heroTag: 'gnotificacion',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChangePrice()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.notification_add, color: Colors.black),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).config_manage_subtitle_changeprice,
                            style: const TextStyle(
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
              heroTag: 'buttonspace',
              onPressed: () {},
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.add_to_photos, color: Colors.black),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).config_manage_subtitle_spaces,
                            style: const TextStyle(
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
          Row(
            children: [
              const SizedBox(
                width: 15,
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
            child: FloatingActionButton(
              heroTag: 'lenguaje',
              onPressed: () async {
                if (S.current.tittle_settings == "Ajustes") perfs.lenguaje = "es_MX";
                if (S.current.tittle_settings == "Settings") perfs.lenguaje = "en_US";
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Lenguaje(
                              perfs: perfs,
                            )));
                setState(() {});
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 320,
                    height: 35,
                    child: Row(
                      children: [
                        const Icon(Icons.translate_outlined,
                            color: Colors.black),
                        const SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).subtitle_app_lang,
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.black)
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
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    height: 35,
                    width: 320,
                    child: Row(
                      children: [
                        const Icon(Icons.notifications, color: Colors.black),
                        const SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            S.of(context).subtitle_app_noti,
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.black)
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
          const SizedBox(
            width: 25,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.amber),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(
                child: Text(
                  'Administrador',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                ),
              ),
              FittedBox(
                child: Text(
                  perfs.email,
                  style: const TextStyle(
                      fontFamily: 'Inter', fontSize: 16, color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
