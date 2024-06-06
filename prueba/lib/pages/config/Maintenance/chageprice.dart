import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/generated/l10n.dart';

class ChangePrice extends StatefulWidget {
  const ChangePrice({super.key});

  @override
  State<ChangePrice> createState() => _ChangePriceState();
}

class _ChangePriceState extends State<ChangePrice> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: altura * .025,
            ),
            buttonregreso(),
            SizedBox(
              height: altura * .025,
            ),
            boxcentral(),
          ],
        ),
      )),
    );
  }

  Widget boxcentral(){
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    Preferencias prefs = Preferencias();
    return Container(
      height: altura * .5,
      width: ancho * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber
      ),
      child: Column(
        children: [
          Text('Precio actual'),
          Text("${prefs.price}")
        ],
      ),
    );
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
}
