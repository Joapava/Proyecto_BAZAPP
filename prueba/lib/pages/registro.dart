// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/pages/inicio.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFour, itemFive, itemsix}
SampleItem? selectedMenu;

SampleItem? giro;

bool isChecked = false;

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
          alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 50,
          ),
            regreso(),
            Texto(),
            SizedBox(
              height: 20,
            ),
            Divider(
              endIndent: 60,
              indent: 60,
              thickness: .6,
            ),
            SizedBox(
              height: 20,
            ),
            Getformulario(),
          ],
        ),
      ),) 
    );
  }
}

class Texto extends StatelessWidget {
  const Texto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Registro', 
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 35,
        color: Colors.white
      ),),
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
  final formKey = GlobalKey<FormState>();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  TextEditingController password2control = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  Color validar = Colors.white;
  bool isVisible = true;
  bool isVisiblebtn2 = true;
  @override
  Widget build(BuildContext context){
  return Column(
    children: [
      const Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Text('Nombre',
            style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 17,
          ),)
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(115, 87, 87, 94),
          borderRadius: BorderRadius.circular(13),
          ),
            child: SizedBox(
              width: 265,
              height: 50,
              child: Form(
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                      prefixIcon: Icon(Icons.account_box_rounded, color: Color.fromARGB(101, 255, 255, 255),),
                      border: InputBorder.none,
                      hintText: 'Ingresa tu nombre',
                    ),
                  ),
                ),
            ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Text('Correo',
            style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 17,
          ),)
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(115, 87, 87, 94),
          borderRadius: BorderRadius.circular(13),
          ),
  
            child: SizedBox(
              width: 265,
              height: 50,
              child: Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    if(!EmailValidator.validate(value.toString())){
                      return 'Coloca un correo valido';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  controller: emailcontrol,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                      border: InputBorder.none,
                      hintText: 'Ingresa tu correo',
                      prefixIcon: Icon(Icons.email_outlined, color: Color.fromARGB(101, 255, 255, 255),)
                    ),
                  ),
                ),
            ),
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Text('Contraseña',
            style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 17,
          ),)
        ],
      ),
      Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(115, 87, 87, 94),
          borderRadius: BorderRadius.circular(13),
          ),
            child: Row(
              children: [
                SizedBox(
          width: 365,
          height: 35,
          child: Form(child: 
            TextFormField(
              controller: passwordcontrol,
              style: const TextStyle(color: Colors.white),
              obscureText: isVisible,
              decoration: const InputDecoration(
                contentPadding: EdgeInsetsDirectional.symmetric(),
                hintText: 'Ingrese su contraseña' ,
                hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                prefixIcon: Icon(Icons.lock_person_outlined , color: Color.fromARGB(101, 255, 255, 255)),
                focusedBorder: InputBorder.none,
                border: InputBorder.none
              ),
            )
          ),
        ),
          SizedBox(
            width: 30,
            height: 30,
            child: FloatingActionButton(onPressed: () {
              setState(() {
                change(1);
              });
              },
              backgroundColor: const Color.fromARGB(0, 87, 87, 95),
              elevation: 0,
              
              heroTag: 'btn1',
              child: const Icon(Icons.remove_red_eye_outlined, color: Color.fromARGB(101, 255, 255, 255)),
            ),
            )
              ],
            )
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Text('Verificar contraseña',
            style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 17,
          ),)
        ],
      ),
      Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(115, 87, 87, 94),
          borderRadius: BorderRadius.circular(13),
          ),
            child: Row(
              children: [
                SizedBox(
          width: 365,
          height: 35,
          child: Form(child: 
            TextFormField(
              controller: password2control,
              style: const TextStyle(color: Colors.white),
              obscureText: isVisiblebtn2,
              decoration: const InputDecoration(
                contentPadding: EdgeInsetsDirectional.symmetric(),
                hintText: 'Vuelva a ingresar su contraseña' ,
                hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                prefixIcon: Icon(Icons.lock_person_outlined , color: Color.fromARGB(101, 255, 255, 255)),
                focusedBorder: InputBorder.none,
                border: InputBorder.none
              ),
            )
          ),
        ),
          SizedBox(
            width: 30,
            height: 30,
            child: FloatingActionButton(onPressed: () {
              setState(() {
                change(2);
        });
              },
              backgroundColor: const Color.fromARGB(0, 87, 87, 95),
              elevation: 0,
              
              heroTag: 'btn2',
              child: const Icon(Icons.remove_red_eye_outlined, color: Color.fromARGB(101, 255, 255, 255)),
            ),
            )
              ],
            )
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Text('Celular',
            style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 17,
          ),)
        ],
      ),
      Container(
  width: 400,
  height: 50,
  decoration: BoxDecoration(
    color: const Color.fromARGB(115, 87, 87, 94),
    borderRadius: BorderRadius.circular(13),
  ),
  child: TextFormField(
    controller: phone,
    style: const TextStyle(color: Colors.white),
    keyboardType: TextInputType.phone,
    maxLength: 10, // Alinea el texto al centro
    decoration: const InputDecoration(
      hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
      border: InputBorder.none,
      hintText: 'Ingrese su número celular',
      prefixIcon: Icon(Icons.phone, color: Color.fromARGB(101, 255, 255, 255),),
      counterText: "", // Elimina el contador de longitud
    ),
  ),
),
  const SizedBox(
    height: 15,
  ),
  Row(
    children: [
      const SizedBox(
        width: 25,
      ),
    Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ccolor()
      ),
    ),
    const SizedBox(
      width: 10,
    ),
    Text('Debe de incluir numeros',
    style: TextStyle(
      fontFamily: 'Inter',
      color: ccolor(),
      fontSize: 15
    ),)
  ],),
  Row(
    children: [
      const SizedBox(
        width: 25,
      ),
    Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ccolor()
      ),
    ),
    const SizedBox(
      width: 10,
    ),
    Text('Debe de contener al menos una letra mayuscula',
    style: TextStyle(
      fontFamily: 'Inter',
      color: ccolor(),
      fontSize: 15
    ),)
  ],),
      const SizedBox(
        height: 40,
      ),
      SizedBox(
      width: 400,
      height: 50,
      child: FloatingActionButton(onPressed:  () {
          if (formKey.currentState!.validate()) {
            datos();
          }
        },
        backgroundColor: Colors.white,
        child: const Text("Registrar")),
    ),
        const SizedBox(
          height: 20,
        ),

      ],
  );
  
}

  bool pw2(){
    if(passwordcontrol.text.isNotEmpty && password2control.text.isNotEmpty){
      if(passwordcontrol.text == password2control.text){
      Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Inicio()));
    }
    }
    
    return false;
  }

  bool emailc(){
    if(EmailValidator.validate(emailcontrol.text)){
      return true;
    }
    return false;
  }

  void datos(){
    if(name.text.isNotEmpty){
      print(emailc());
    }
  }

  void change(int n){
    if(n == 1){
      if(isVisible){
        isVisible = false;
      } else{
      isVisible = true;
      }
    } else if(n == 2){
      if(isVisiblebtn2){
        isVisiblebtn2 = false;
      } else{
        isVisiblebtn2 = true;
      }
    }
  }

  Color ccolor(){
    return Colors.white;
  }

}

// ignore: camel_case_types
class regreso extends StatelessWidget {
  const regreso({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
    width: 40,
    height: 40,
    child: FloatingActionButton(
      heroTag: 'btnr',
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(25)
      ),
      onPressed: () {
      Navigator.pop(context);
    },
    child: const Icon(Icons.arrow_back  , color: Colors.white,)
    ),
        )
      ],
    );
  }
}
