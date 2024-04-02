// ignore: file_names
import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFour, itemFive, itemsix}
SampleItem? selectedMenu;

SampleItem? giro;

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
              Getformulario(),
          ],
        ),
      ),) 
    );
  }
}

class Getformulario extends StatefulWidget{
  const Getformulario({super.key});

  @override
  State<Getformulario> createState()=> _Getformulario();
}

class _Getformulario extends State<Getformulario>
{
  @override
  Widget build(BuildContext context){
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
      const SizedBox(
        height: 20,
      ),
      Container(
              width: 295,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xffF9F9FF),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 190,
                      height: 50,
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              texto(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 0, 0, .7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    PopupMenuButton<SampleItem>(
                      initialValue: selectedMenu,
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (SampleItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemOne,
                          child: Text('Cliente'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemTwo,
                          child: Text('Expositor'),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
        const SizedBox(
          height: 20,
        ),
        Getopciones(tipo: texto())
      ],
  );
  
}
String texto() {
    if (selectedMenu == SampleItem.itemOne) {
      return 'Cliente';
    } else if (selectedMenu == SampleItem.itemTwo) {
      return 'Expositor';
    } else {
      return 'Favor de especificar';
    }
  }
}

// ignore: non_constant_identifier_names
String tipo_giro(){
  if(giro == SampleItem.itemOne){
    return 'Comida';
  }else if(giro == SampleItem.itemTwo){
    return 'Ropa';
  } else if(giro == SampleItem.itemThree){
    return 'Accesorios';
  } else if(giro == SampleItem.itemFour){
    return 'Bisuteria';
  } else if(giro == SampleItem.itemFive){
    return 'Bebidas';
  } else if(giro == SampleItem.itemsix){
    return 'Snacks';
  } else {
    return 'No especificado';
  }
}



class Getopciones extends StatefulWidget {
  final String tipo;
  const Getopciones({super.key, required this.tipo});

  @override
  State<Getopciones> createState()=> _Getopciones();
}

class _Getopciones extends State<Getopciones>{
  @override
  Widget build(BuildContext context){
  if(widget.tipo.compareTo('Expositor') == 0){
    return Column(children: [
      Container(
              width: 295,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xffF9F9FF),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 190,
                      height: 50,
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              tipo_giro(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 0, 0, .7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    PopupMenuButton<SampleItem>(
                      initialValue: giro,
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (SampleItem item) {
                        setState(() {
                          giro = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemOne,
                          child: Text('Comida'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemTwo,
                          child: Text('Ropa'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemThree,
                          child: Text('Accesorios'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemFour,
                          child: Text('Bisuteria'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemFive,
                          child: Text('Bebidas'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemsix,
                          child: Text('Snacks'),
                        ),
                      ],
                    )
                  ],
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
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nombre del negocio (opcional )',
                    ),
                  ),
                ),
            ),
          ),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 40,
        width: 150,
        child: FloatingActionButton(onPressed: ()=>(),
        backgroundColor: Colors.blue,
        child: const Text("Registrar"),
        ),
      ),
      
    ]); 
  } else{
    return SizedBox(
      width: 150,
      height: 50,
      child: FloatingActionButton(onPressed: ()=>(),
        backgroundColor: Colors.blue,
        child: const Text("Registrar")),
    );
  }
}
}