import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/pages/registro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState () => _Login();
}

class _Login extends State<Login>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: BoxCentral()
        ) 
    );
  }
}

class BoxCentral extends StatefulWidget {
  const BoxCentral({super.key});

  @override
  State<BoxCentral> createState ()=> _BoxCentral();
}

class _BoxCentral extends State<BoxCentral> {
  @override
  Widget build(BuildContext context){
    return   
    Column(children: [
      const SizedBox(
        height: 25,
      ),
      Row(children: [
        const SizedBox(
          width: 10,
        ),
        SizedBox(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(25)
          ),
          onPressed: () {
          
        },
        child: const Icon(Icons.arrow_back  , color: Colors.white,)
        ),
      )
      ],),
      const FittedBox(
        child: Text('Inicia Sesión en tu cuenta', 
      style: TextStyle(fontSize: 20, fontFamily: 'Inter', color: Colors.white, 
      decoration: TextDecoration.none
      ),),),
      const SizedBox(
        height: 10,
      ),
      const FittedBox(
        child: Text('Bienvenido de nuevo! Por favor ingresa tus datos',
        style: TextStyle(fontSize: 15,
        color: Color.fromARGB(101, 255, 255, 255),
        fontFamily: 'inter',
        decoration: TextDecoration.none),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Divider(
        indent: 15,
        endIndent: 15,
        thickness: .6,
      ),
      const SizedBox(
        height: 30,
      ),
      const Row(children: [
        SizedBox(
          width: 28,
        ),
        Text('Correo', style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontFamily: 'inter-bold',
          fontSize: 20
          ),)
      ],),
      const SizedBox(
        height: 5,
      ),
      Container(
        width: 400,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(115, 87, 87, 94)
        ),
        child: Row(children: [

          SizedBox(
            width: 380,
            height: 35,
            child: Form(child: 
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(),
                  hintText: 'Ingrese su correo' ,
                  hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                  prefixIcon: Icon(Icons.email_outlined , color: Color.fromARGB(101, 255, 255, 255)),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none
                ),
              )
            ),
          )
        ],
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      const Row(children: [
        SizedBox(
          width: 28,
        ),
        Text('Contraseña', style: TextStyle(
          fontFamily: 'Inter',
          color: Colors.white,
          fontSize: 20
        ),)
      ],),
      const SizedBox(
        height: 5,
      ),
      Container(
        width: 400,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(115, 87, 87, 94)
        ),
        child: Row(children: [

          SizedBox(
            width: 330,
            height: 35,
            child: Form(child: 
              TextFormField(
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(),
                  hintText: 'ingrese su contraseña' ,
                  hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                  prefixIcon: Icon(Icons.lock_person_outlined , color: Color.fromARGB(101, 255, 255, 255)),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none
                ),
              )
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: FloatingActionButton(onPressed: () {
              },
              backgroundColor: const Color.fromARGB(115, 87, 87, 94),
              elevation: 0,
              child: const Icon(Icons.remove_red_eye_outlined, color: Color.fromARGB(101, 255, 255, 255)),
            ),
          )
        ],
        ),
      ),
      const Align(
        alignment: Alignment.topRight,
        widthFactor: 2.2,
        child: Text('¿Olvidaste tu contraseña?', style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontFamily: 'inter'
        ),),
      ),
      const SizedBox(
        height: 35,
      ),
      SizedBox(
        width: 400,
        height: 50,
        child: FloatingActionButton(onPressed: () {
          
        }, backgroundColor: Colors.white,child: const Text('Ingresar'),),
      ),
      const SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text('¿Aún no tienes cuenta?', style: TextStyle(color: Colors.white),),
        TextButton(
                onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registro()))),
                child: const Text(
                  'Registrate aqui',
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,
                  decorationColor: Colors.blue
                  ),
                ))
      ],)
    ],

    );
  }
  
}


