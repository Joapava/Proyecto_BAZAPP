// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/Negocio/InsertarDatos.dart';
import 'package:prueba/Objetos/Expositor.dart';
import 'package:prueba/pages/inicio.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:prueba/Negocio/ValidarDatos.dart';
import 'package:prueba/pages/login.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFour, itemFive, itemsix }

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
        body: SafeArea(
          child: SingleChildScrollView(
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
          ),
        ));
  }
}

class Texto extends StatelessWidget {
  const Texto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Registro',
        style:
            TextStyle(fontFamily: 'Inter', fontSize: 35, color: Colors.white),
      ),
    );
  }
}

class Getformulario extends StatefulWidget {
  const Getformulario({super.key});

  @override
  State<Getformulario> createState() => _Getformulario();
}

class _Getformulario extends State<Getformulario> {
  final formname = GlobalKey<FormState>();
  final formemail = GlobalKey<FormState>();
  final formpwd = GlobalKey<FormState>();
  final formpwd2 = GlobalKey<FormState>();
  final formphone = GlobalKey<FormState>();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  TextEditingController password2control = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  bool isErrorname = false;
  bool isErroremail = false;
  bool isError = false;
  bool isErrorpwd = false;
  bool isErrorphone = false;
  bool isVisible = true;
  bool isVisiblebtn2 = true;
  int? x;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              'Nombre',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 17,
              ),
            )
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
              border: Border.all(
                  color: isErrorname
                      ? Colors.red
                      : const Color.fromARGB(0, 87, 87, 94))),
          child: SizedBox(
            width: 265,
            height: 50,
            child: Form(
              key: formname,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      isErrorname = true;
                    });
                  }
                  setState(() {
                    isErrorname = false;
                  });
                  return null;
                },
                style: const TextStyle(color: Colors.white),
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintStyle:
                      TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                  prefixIcon: Icon(
                    Icons.account_box_rounded,
                    color: Color.fromARGB(101, 255, 255, 255),
                  ),
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
            Text(
              'Correo',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 17,
              ),
            )
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
              border: Border.all(
                  color: isErroremail
                      ? Colors.red
                      : const Color.fromARGB(0, 87, 87, 94))),
          child: SizedBox(
            width: 265,
            height: 50,
            child: Form(
              key: formemail,
              child: TextFormField(
                validator: (value) {
                  if (!EmailValidator.validate(value.toString())) {
                    setState(() {
                      isErroremail = true;
                    });
                    return 'Coloca un correo valido';
                  }
                  if (x == 1 || x == 3) {
                    setState(() {
                      isErroremail = true;
                    });
                    return 'Correo ya registrado';
                  }
                  setState(() {
                    isErroremail = false;
                  });
                  return null;
                },
                style: const TextStyle(color: Colors.white),
                controller: emailcontrol,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                    border: InputBorder.none,
                    hintText: 'Ingresa tu correo',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color.fromARGB(101, 255, 255, 255),
                    )),
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
            Text(
              'Contraseña',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 17,
              ),
            )
          ],
        ),
        Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(115, 87, 87, 94),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                    color: isError
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
                          if (value!.length < 8) {
                            setState(() {
                              isError = true;
                            });
                            return null;
                          }
                          bool v1 = value.contains(RegExp(r'[0-9]'));
                          bool v2 = value.contains(RegExp(r'[A-Z]'));
                          if (!v1 && !v2 || v1 && !v2 || !v1 && v2) {
                            setState(() {
                              isError = true;
                            });
                            return null;
                          }
                          setState(() {
                            isError = false;
                          });
                          return null;
                        },
                        controller: passwordcontrol,
                        style: const TextStyle(color: Colors.white),
                        obscureText: isVisible,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsetsDirectional.symmetric(),
                          hintText: 'Ingrese su contraseña',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(101, 255, 255, 255)),
                          prefixIcon: Icon(Icons.lock_person_outlined,
                              color: Color.fromARGB(101, 255, 255, 255)),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      )),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        change(1);
                      });
                    },
                    backgroundColor: const Color.fromARGB(0, 87, 87, 95),
                    elevation: 0,
                    heroTag: 'btn1',
                    child: const Icon(Icons.remove_red_eye_outlined,
                        color: Color.fromARGB(101, 255, 255, 255)),
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              'Verificar contraseña',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 17,
              ),
            )
          ],
        ),
        Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(115, 87, 87, 94),
                borderRadius: BorderRadius.circular(13),
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
                      key: formpwd2,
                      child: TextFormField(
                        validator: (value) {
                          if (value != passwordcontrol.text) {
                            setState(() {
                              isErrorpwd = true;
                            });
                            return null;
                          } else if (password2control.text.isEmpty) {
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
                        controller: password2control,
                        style: const TextStyle(color: Colors.white),
                        obscureText: isVisiblebtn2,
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            contentPadding: EdgeInsetsDirectional.symmetric(),
                            hintText: 'Vuelva a ingresar su contraseña',
                            hintStyle: TextStyle(
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
                        change(2);
                      });
                    },
                    backgroundColor: const Color.fromARGB(0, 87, 87, 95),
                    elevation: 0,
                    heroTag: 'btn2',
                    child: const Icon(Icons.remove_red_eye_outlined,
                        color: Color.fromARGB(101, 255, 255, 255)),
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              'Celular',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 17,
              ),
            )
          ],
        ),
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(115, 87, 87, 94),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                  color: isErrorphone
                      ? Colors.red
                      : const Color.fromARGB(0, 87, 87, 94))),
          child: Form(
            key: formphone,
            child: TextFormField(
              validator: (value) {
                if (value!.length < 10) {
                  setState(() {
                    isErrorphone = true;
                  });
                  return 'Celular a 10 digitos';
                }
                if (x == 2 || x == 3) {
                  setState(() {
                    isErrorphone = true;
                  });
                  return 'Numero ya registrado';
                }
                setState(() {
                  isErrorphone = false;
                });
                return null;
              },
              controller: phone,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              maxLength: 10, // Alinea el texto al centro
              decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                hintStyle: TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                border: InputBorder.none,
                hintText: 'Ingrese su número celular',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color.fromARGB(101, 255, 255, 255),
                ),
                counterText: "", // Elimina el contador de longitud
              ),
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
                  borderRadius: BorderRadius.circular(15), color: ccolor(1)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Debe de incluir numeros',
              style: TextStyle(
                  fontFamily: 'Inter', color: ccolor(1), fontSize: 15),
            )
          ],
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
                  borderRadius: BorderRadius.circular(15), color: ccolor(2)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Debe de contener al menos una letra mayuscula',
              style: TextStyle(
                  fontFamily: 'Inter', color: ccolor(2), fontSize: 15),
            )
          ],
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
                  borderRadius: BorderRadius.circular(15), color: ccolor(3)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Deben de coincidir las contraseñas',
              style: TextStyle(
                  fontFamily: 'Inter', color: ccolor(3), fontSize: 15),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: 400,
          height: 50,
          child: FloatingActionButton(
              onPressed: () async {
                x = 0;
                formemail.currentState!.validate();
                formpwd.currentState!.validate();
                formpwd2.currentState!.validate();
                formphone.currentState!.validate();
                formname.currentState!.validate();
                if (!isErroremail && !isErrorphone) {
                  x = await ValidarDatos()
                      .validar(emailcontrol.text, phone.text);
                  if (x == 1) {
                    setState(() {
                      isErroremail = true;
                      formemail.currentState!.validate();
                    });
                  } else if (x == 2) {
                    setState(() {
                      isErrorphone = true;
                      formphone.currentState!.validate();
                    });
                  } else if (x == 3) {
                    setState(() {
                      formemail.currentState!.validate();
                      formphone.currentState!.validate();
                    });
                  } else if (x == 0) {
                    if (name.text.split(" ").length >= 2) {
                      if (!isError &&
                          !isErroremail &&
                          !isErrorphone &&
                          !isErrorpwd &&
                          !isErrorname) {
                        List<String> nombre = name.text.split(" ");
                        Expositor expositor = Expositor(
                            apellidos: nombre[1],
                            celular: phone.text,
                            password: passwordcontrol.text,
                            correo: emailcontrol.text,
                            nombre: nombre[0]);
                        InsertarDatos().setExpositor(expositor);
                        rLogin();
                      }
                    }
                  }
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

  void rLogin(){
    Navigator.push(
            context, CupertinoPageRoute(builder: (context) => const Login()));
  }

  bool pw2() {
    if (passwordcontrol.text.isNotEmpty && password2control.text.isNotEmpty) {
      if (passwordcontrol.text == password2control.text) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => const Inicio()));
      }
    }

    return false;
  }

  bool emailc() {
    if (EmailValidator.validate(emailcontrol.text)) {
      return true;
    }
    return false;
  }

  void change(int n) {
    if (n == 1) {
      if (isVisible) {
        isVisible = false;
      } else {
        isVisible = true;
      }
    } else if (n == 2) {
      if (isVisiblebtn2) {
        isVisiblebtn2 = false;
      } else {
        isVisiblebtn2 = true;
      }
    }
  }

  Color ccolor(int x) {
    if (x == 1) {
      if (passwordcontrol.text.isEmpty && !isErrorpwd) {
        return Colors.white;
      } else if (RegExp(r'[0-9]').hasMatch(passwordcontrol.text)) {
        return Colors.green;
      }
      return Colors.red;
    } else if (x == 2) {
      if (passwordcontrol.text.isEmpty && !isErrorpwd) {
        return Colors.white;
      } else if (RegExp(r'[A-Z]').hasMatch(passwordcontrol.text)) {
        return Colors.green;
      }
      return Colors.red;
    } else if (x == 3) {
      if (passwordcontrol.text.isEmpty && !isErrorpwd) {
        return Colors.white;
      } else if (password2control.text == passwordcontrol.text &&
          passwordcontrol.text.isNotEmpty) {
        return Colors.green;
      }
      return Colors.red;
    }
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
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
