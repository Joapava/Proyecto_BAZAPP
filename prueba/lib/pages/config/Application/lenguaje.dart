import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/generated/l10n.dart';
import 'package:prueba/main.dart';

class Lenguaje extends StatefulWidget {
  final Preferencias perfs;
  const Lenguaje({super.key, required this.perfs});

  @override
  State<Lenguaje> createState() => _LenguajeState();
}

class _LenguajeState extends State<Lenguaje> {
  late final perfs = widget.perfs;
  final searchcontrol = TextEditingController();
  String search = '';
  @override
  Widget build(BuildContext context) {
    cambiarl(perfs.lenguaje);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: principal(),
        ),
      ),
    );
  }

  Widget principal() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: FittedBox(
            child: Text(
              S.of(context).tittle_lang,
              style: const TextStyle(fontFamily: 'Inter', fontSize: 20),
            ),
          ),
        ),
        buttonregreso(),
        busqueda(),
        const SizedBox(
          height: 20,
        ),
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
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(240, 240, 240, 1)),
          child: Row(
            children: [
              SizedBox(
                width: 270,
                height: 35,
                child: Form(
                    child: TextFormField(
                  controller: searchcontrol,
                  onChanged: (value) {
                    setState(() {
                      search = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsetsDirectional.all(7),
                      hintText: S.of(context).search_box,
                      prefixIcon: const Icon(Icons.search),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
                )),
              )
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              searchcontrol.clear();
              setState(() {
                search = '';
              });
              FocusScope.of(context).unfocus();
            },
            child: Text(
              S.of(context).buttom_cancel,
              style: const TextStyle(
                  fontFamily: 'Inter', fontSize: 18, color: Colors.black),
            ))
      ],
    );
  }

  Widget idiomas() {
    return Container(
        width: 350,
        height: 700,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: ListView.builder(
          itemCount: dataleng.length,
          itemBuilder: (context, index) {
            if (typeleng[index].toLowerCase().contains(search)) {
              return ListTile(
                splashColor: const Color.fromRGBO(251, 251, 251, 1),
                title: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 260,
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataleng[index],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                  fontSize: 18),
                            ),
                            Text(
                              typeleng[index],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        isSeleted(nom[index]) ? Icons.check : null,
                        color: Colors.blue[500],
                      )
                    ],
                  ),
                ),
                selected: isSeleted(nom[index]),
                onTap: () {
                  setState(() {
                    final appState =
                        context.findAncestorStateOfType<BazzAppState>();
                    appState?.changelang(nm[index]);
                    cambiarl(nom[index]);
                  });
                },
              );
            } else {
              return Container();
            }
          },
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

  List<String> dataleng = [
    'Español',
    'English',
    'English (UK)',
    'Français',
    'Deutsch',
    '日本語'
  ];

  List<String> typeleng = [
    'Español (latinoamerica)',
    'Ingles (estados unidos)',
    'Ingles (R.U.)',
    'Frances',
    'Aleman',
    'Japones'
  ];

  List<String> nom = ['es_MX', 'en_US', 'en_UK', 'fr', 'de', 'ja'];
  List<Locale> nm = [
    const Locale('es', 'MX'),
    const Locale('en', 'US'),
    const Locale('en', 'UK'),
    const Locale('fr'),
    const Locale('de'),
    const Locale('ja')
  ];

  bool isSeleted(String lenguaje) {
    if (lenguaje == perfs.lenguaje) {
      return true;
    }
    return false;
  }

  void cambiarl(String lenguaje) {
    if (lenguaje == 'en') {
      lenguaje = 'en_US';
    }
    perfs.lenguaje = lenguaje;
    setState(() {
      isSeleted(lenguaje);
    });
  }

  @override
  void dispose() {
    searchcontrol.dispose();
    super.dispose();
  }
}