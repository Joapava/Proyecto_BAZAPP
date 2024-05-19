import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba/Negocio/ValidarDatos.dart';
import 'package:prueba/Negocio/autenticar.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
// import 'package:prueba/Persistencia/auth_facebook.dart';
import 'package:prueba/Persistencia/auth_google.dart';
import 'package:prueba/pages/registro.dart';
import 'package:prueba/pages/home.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:prueba/pages/reiniciar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            SystemNavigator.pop();
          },
          child:
              const SafeArea(child: SingleChildScrollView(child: BoxCentral())),
        ));
  }
}

class BoxCentral extends StatefulWidget {
  const BoxCentral({super.key});

  @override
  State<BoxCentral> createState() => _BoxCentral();
}

class _BoxCentral extends State<BoxCentral> {
  final perfs = Preferencias();
  final formnemail = GlobalKey<FormState>();
  final formpwd = GlobalKey<FormState>();
  bool isErroremail = false;
  bool isErrorpwd = false;
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        const FittedBox(
          child: Text(
            'Inicia Sesión en tu cuenta',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Inter',
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const FittedBox(
          child: Text(
            'Bienvenido de nuevo! Por favor ingresa tus datos',
            style: TextStyle(
                fontSize: 18,
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
          height: 10,
        ),
        messageError(),
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            SizedBox(
              width: 28,
            ),
            Text(
              'Correo',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontFamily: 'inter',
                  fontSize: 20),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        box_correo(),
        const SizedBox(
          height: 25,
        ),
        const Row(
          children: [
            SizedBox(
              width: 28,
            ),
            Text(
              'Contraseña',
              style: TextStyle(
                  fontFamily: 'Inter', color: Colors.white, fontSize: 20),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        box_password(),
        Align(
          alignment: Alignment.topRight,
          widthFactor: 1.6,
          child: TextButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Reiniciar()));
                // cleancontroller();
              }),
              child: const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontFamily: 'inter',
                    fontSize: 18),
              )),
        ),
        newMethod(),
        boton_ingresar(),
        const SizedBox(
          height: 40,
        ),
        const Center(
          child: Text(
            'O ingresa con',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Color.fromARGB(117, 255, 255, 255)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        botones_inicio(),
        const SizedBox(
          height: 10,
        ),
        registro_box(),
      ],
    );
  }

  FittedBox messageError() {
    if (isErroremail || isErrorpwd) {
      return const FittedBox(
        child: Text(
          'Correo o contraseña incorrectos',
          style:
              TextStyle(color: Colors.red, fontFamily: 'Inter', fontSize: 18),
        ),
      );
    }
    return const FittedBox();
  }

  SizedBox newMethod() {
    return const SizedBox(
      height: 35,
    );
  }

  // ignore: non_constant_identifier_names
  Widget box_password() {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(115, 87, 87, 94),
          border: Border.all(
              color: isErrorpwd
                  ? Colors.red
                  : const Color.fromARGB(0, 87, 87, 94))),
      child: Row(
        children: [
          SizedBox(
            width: 365,
            height: 35,
            child: Form(
                key: formpwd,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        isErrorpwd = true;
                      });
                      return null;
                    }
                    setState(() {
                      isErrorpwd = false;
                    });
                    return null;
                  },
                  controller: passwordcontrol,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'Inter', fontSize: 18),
                  obscureText: isVisible,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 12),
                      hintText: 'Ingrese su contraseña',
                      hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Color.fromARGB(101, 255, 255, 255)),
                      prefixIcon: Icon(Icons.lock_person_outlined,
                          color: Color.fromARGB(101, 255, 255, 255)),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                )),
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
              child: isVisible
                          ? Image.asset('assets/eye.png',color: const Color.fromARGB(101, 255, 255, 255))
                          : Image.asset('assets/eye-line.png',color: const Color.fromARGB(101, 255, 255, 255)),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget box_correo() {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(115, 87, 87, 94),
          border: Border.all(
              color: isErroremail
                  ? Colors.red
                  : const Color.fromARGB(0, 87, 87, 94))),
      child: Row(
        children: [
          SizedBox(
            width: 380,
            height: 35,
            child: Form(
                key: formnemail,
                child: TextFormField(
                  validator: (value) {
                    if (!EmailValidator.validate(value.toString())) {
                      setState(() {
                        isErroremail = true;
                      });
                      return null;
                    }
                    setState(() {
                      isErroremail = false;
                    });
                    return null;
                  },
                  controller: emailcontrol,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'Inter', fontSize: 18),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 12),
                      hintText: 'Ingrese su correo',
                      hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Color.fromARGB(101, 255, 255, 255)),
                      prefixIcon: Icon(Icons.email_outlined,
                          color: Color.fromARGB(101, 255, 255, 255)),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                )),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget boton_ingresar() {
    return SizedBox(
      width: 400,
      height: 50,
      child: FloatingActionButton(
        onPressed: (() async {
          formnemail.currentState!.validate();
          formpwd.currentState!.validate();
          if (!isErroremail && !isErrorpwd) {
            String id = await Autenticar().iniciarsesion(
                email: emailcontrol.text, pwd: passwordcontrol.text);
            if (id.isNotEmpty) {
              ValidarDatos().datoslogin(id);
              funcion_ingreso();
            } else {
              setState(() {
                isErroremail = true;
              isErrorpwd = true;
              });
              
              messageError();
            }
          }else {
            setState(() {
              isErroremail = true;
              isErrorpwd = true;
            });
              
              messageError();
            }
        }),
        backgroundColor: Colors.white,
        child: const Text(
          'Ingresar',
          style: TextStyle(fontFamily: 'Inter', fontSize: 18),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void funcion_ingreso() {
    if(mounted){
      Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => const Home()),(Route<dynamic> route) => false);
    }
    
  }

  // ignore: non_constant_identifier_names
  void funcion_registro(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Registro()));
  }

  void change() {
    if (isVisible) {
      isVisible = false;
    } else {
      isVisible = true;
    }
  }

  // ignore: non_constant_identifier_names
  Widget registro_box() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿Aún no tienes cuenta?',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Hero(
            tag: 'pestana',
            child: TextButton(
                onPressed: (() {
                  setState(() {
                    isErroremail = false;
                    isErrorpwd = false;
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registro()));
                }),
                child: const Text(
                  'Registrate aqui',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue),
                )))
      ],
    );
  }



  // ignore: non_constant_identifier_names
  Widget botones_inicio() {
    return SizedBox(
      width: 240,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
              // Authfacebook().signInWithFacebook();
            },
            heroTag: 'btnface',
            backgroundColor: const Color.fromARGB(117, 87, 87, 95),
            child: Image.asset('assets/facebook-logo.png'),
          ),
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
}
