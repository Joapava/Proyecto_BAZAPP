// ignore: file_names
import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
              getformulario(context),
          ],
        ),
      ),
    );
  }
}

Widget getformulario(BuildContext context)
{
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Container(
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                    child: const Text("Registro", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: ("Arial")),)
                    )
          ),
      const SizedBox(
        height: 50,
      ),
      Container(
        width: 295,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 227, 231),
          borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: SizedBox(
              width: 265,
              height: 50,
              child: Form(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nombre Completo',
                    ),
                  ),
                ),
            ),
          ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        width: 295,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 227, 231),
          borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: SizedBox(
              width: 265,
              height: 50,
              child: Form(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Correo',
                    ),
                  ),
                ),
            ),
          ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        width: 295,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 227, 231),
          borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: SizedBox(
              width: 265,
              height: 50,
              child: Form(
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Contraseña',
                    ),
                  ),
                ),
            ),
          ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        width: 295,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 227, 231),
          borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: SizedBox(
              width: 265,
              height: 50,
              child: Form(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Celular',
                    ),
                  ),
                ),
            ),
          ),
      ),
      PopupMenuButton<SampleItem>(
                      initialValue: selectedMenu,
                      onSelected: (SampleItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemOne,
                          child: Text('Femenino'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemTwo,
                          child: Text('Masculino'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemThree,
                          child: Text('No especificar'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    ],
  );
}

