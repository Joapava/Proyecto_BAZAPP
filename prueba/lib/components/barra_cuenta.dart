import 'package:flutter/material.dart';

class barraCuenta extends StatefulWidget {
  const barraCuenta({super.key});

  @override
  State<barraCuenta> createState() => _barraCuentaState();
}

class _barraCuentaState extends State<barraCuenta> {
  @override
  Widget build(BuildContext context) {
    return llenarBarraCuenta();
  }
}

Widget llenarBarraCuenta() {
  return Column(
    children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
            child: const Text(
              "Nombre cuenta",
              style: TextStyle(
                  color: Color.fromRGBO(113, 147, 156, 1.0), fontSize: 15),
            )),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 75,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              //padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(168, 169, 171, 0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Text(
                "admin",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(113, 147, 156, 1.0)),
              )),
        ),
      ),
    ],
  );
}
