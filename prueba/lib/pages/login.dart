import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/pages/registro.dart';
import 'package:prueba/pages/inicio.dart';

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
      body: SafeArea(child: SingleChildScrollView(child: BoxCentral())
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
    return Column(children: [
      const SizedBox(
        height: 25,
      ),
      const regreso(),
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
        indent: 35,
        endIndent: 35,
        thickness: .6,
        color: Color.fromARGB(101, 255, 255, 255),
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
      const box_correo(),
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
      const box_password(),
      Align(
        alignment: Alignment.topRight,
        widthFactor: 2.2,
        child: TextButton(onPressed: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registro()))), 
          child: const Text('¿Olvidaste tu contraseña?', style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontFamily: 'inter'
        ),)),
      ),
      const SizedBox(
        height: 35,
      ),
      const boton_ingresar(),
      const SizedBox(
        height: 40,
      ),
      const Center(
        child: Text('O ingresa con',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          color: Color.fromARGB(117, 255, 255, 255)
        ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const botones_inicio(),
      const SizedBox(
        height: 10,
      ),
      const registro_box(),
    ],
    );
  }

  int prueba(){
    return 1;
  }

}

// ignore: camel_case_types
class botones_inicio extends StatelessWidget {
  const botones_inicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 60,
      child: Row(children: [
        FloatingActionButton(onPressed: () => (),
        heroTag: 'btngoogle',
        backgroundColor: const Color.fromARGB(117, 87, 87, 95),
        child: Image.asset('assets/google-icon.png'),
        ),
        const SizedBox(
          width: 35,
        ),
        FloatingActionButton(onPressed: () => (),
        heroTag: 'btnface',
        backgroundColor: const Color.fromARGB(117, 87, 87, 95),
        child: Image.asset('assets/facebook-logo.png'),
        ),
        const SizedBox(
          width: 35,
        ),
        FloatingActionButton(onPressed: () => (),
        heroTag: 'btnapple',
        backgroundColor: const Color.fromARGB(117, 87, 87, 95),
        child: Image.asset('assets/apple-logo.png'),
        )
      ],),
    );
  }
}

// ignore: camel_case_types
class regreso extends StatelessWidget {
  const regreso({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
    const SizedBox(
      width: 10,
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
      
    },
    child: const Icon(Icons.arrow_back  , color: Colors.white,)
    ),
        )
        ],);
  }
}

// ignore: camel_case_types
class box_password extends StatefulWidget {
  const box_password({
    super.key,
  });

  @override
  State<box_password> createState() => _box_passwordState();
}

class _box_passwordState extends State<box_password> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(115, 87, 87, 94)
      ),
      child: Row(children: [
        SizedBox(
          width: 365,
          height: 35,
          child: Form(child: 
            TextFormField(
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
            child: FloatingActionButton(
              onPressed: () {
              setState(() {
                change();
              });
              },
              backgroundColor: const Color.fromARGB(0, 87, 87, 95),
              elevation: 0,
              
              heroTag: 'btn1',
              child: const Icon(Icons.remove_red_eye_outlined, color: Color.fromARGB(101, 255, 255, 255)),
            ),
            )
        
      ],
      ),
    );
  }

  void change(){
    if(isVisible){
      isVisible = false;
    } else{
      isVisible = true;
    }
  }
}

// ignore: camel_case_types
class registro_box extends StatelessWidget {
  const registro_box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Text('¿Aún no tienes cuenta?', style: TextStyle(color: Colors.white),),
      Hero(tag: 'pestana', 
      child:  TextButton(
        
              onPressed: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registro()))),
              child: const Text(
                'Registrate aqui',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,
                decorationColor: Colors.blue
                ),
              )))
    ],);
  }
}

// ignore: camel_case_types
class boton_ingresar extends StatelessWidget {
  const boton_ingresar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: FloatingActionButton(
        onPressed: (() => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Inicio()))), backgroundColor: Colors.white,child: const Text('Ingresar'),),
    );
  }
<<<<<<< Updated upstream
=======



  // ignore: non_constant_identifier_names
  Widget botones_inicio() {
    return SizedBox(
      width: 240,
      height: 60,
      child: Row(
        children: [
          FloatingActionButton(
            onPressed: () async {
              bool registrado = await Autenticar().google();
              if(registrado){
                funcion_ingreso();
              }else{
                Authgoole().singout();
                funcion_registro();
              }
            },
            heroTag: 'btngoogle',
            backgroundColor: const Color.fromARGB(117, 87, 87, 95),
            child: Image.asset('assets/google-icon.png'),
          ),
          const SizedBox(
            width: 35,
          ),
          FloatingActionButton(
            onPressed: () {
              print('facebook');
            },
            heroTag: 'btnfacebook',
            backgroundColor: const Color.fromARGB(117, 87, 87, 95),
            child: Image.asset('assets/facebook-logo.png'),
          ),
          const SizedBox(
            width: 35,
          ),
          FloatingActionButton(
            onPressed: () {
              print('apple');
            },
            heroTag: 'btnapple',
            backgroundColor: const Color.fromARGB(117, 87, 87, 95),
            child: Image.asset('assets/apple-logo.png'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailcontrol.dispose();
    passwordcontrol.dispose();
    super.dispose();
  }
>>>>>>> Stashed changes
}

// ignore: camel_case_types
class box_correo extends StatelessWidget {
  const box_correo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}