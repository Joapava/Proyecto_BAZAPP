// ignore: file_names
import 'package:flutter/material.dart';
import 'package:prueba/Negocio/InsertarDatos.dart';
import 'package:prueba/Negocio/autenticar.dart';
import 'package:prueba/Class/Expositor.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:prueba/Negocio/ValidarDatos.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/generated/l10n.dart';
import 'package:prueba/pages/Login/login.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final perfs = Preferencias();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 50,
                ),
                const regreso(),
                const Texto(),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  endIndent: 60,
                  indent: 60,
                  thickness: .6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Getformulario(
                  perfs: perfs,
                ),
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
    return Center(
      child: Text(
        S.of(context).register,
        style:
            const TextStyle(fontFamily: 'Inter', fontSize: 35, color: Colors.white),
      ),
    );
  }
}

class Getformulario extends StatefulWidget {
  final Preferencias perfs;
  const Getformulario({super.key, required this.perfs});

  @override
  State<Getformulario> createState() => _Getformulario();
}

class _Getformulario extends State<Getformulario> {
  final formname = GlobalKey<FormState>();
  final formemail = GlobalKey<FormState>();
  final formpwd = GlobalKey<FormState>();
  final formpwd2 = GlobalKey<FormState>();
  final formphone = GlobalKey<FormState>();
  late TextEditingController emailcontrol =
      TextEditingController(text: widget.perfs.email);
  TextEditingController passwordcontrol = TextEditingController();
  TextEditingController password2control = TextEditingController();
  TextEditingController phone = TextEditingController();
  late TextEditingController name =
      TextEditingController(text: widget.perfs.nombre);
  bool isErrorname = false;
  bool isErroremail = false;
  bool isError = false;
  bool isErrorpwd = false;
  bool isErrorphone = false;
  bool isVisible = true;
  bool isVisiblebtn2 = true;
  String emailError = "";
  String phoneError = "";
  int? x;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              S.of(context).regiter_subtitle_name,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 18,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        nombrebox(),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              S.of(context).register_subtitle_email,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 18,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        emailbox(),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              emailError,
              style: const TextStyle(
                  fontFamily: 'Inter', color: Colors.red, fontSize: 16),
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              S.of(context).register_subtitle_password,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 18,
              ),
            )
          ],
        ),
        pwdbox(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              S.of(context).register_placeholder_passwordvry,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 18,
              ),
            )
          ],
        ),
        confirmacionpwd(),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              S.of(context).register_subtitle_phone,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 18,
              ),
            )
          ],
        ),
        celularbox(),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              phoneError,
              style: const TextStyle(
                  fontFamily: 'Inter', color: Colors.red, fontSize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        txtvalidaciones(),
        const SizedBox(
          height: 40,
        ),
        buttonregistro(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  SizedBox buttonregistro() {
    return SizedBox(
      width: 400,
      height: 50,
      child: FloatingActionButton(
          onPressed: () async {
            x = 0;
            formname.currentState!.validate();
            formemail.currentState!.validate();
            formpwd.currentState!.validate();
            formpwd2.currentState!.validate();
            formphone.currentState!.validate();

            if (!isErroremail && !isErrorphone) {
              x = await ValidarDatos().validarCelular(phone.text);

              if (x == 1) {
                setState(() {
                  isErrorphone = true;
                  formphone.currentState!.validate();
                });
              } else if (x == 0) {
                if (name.text.split(" ").length >= 2) {
                  if (!isError &&
                      !isErroremail &&
                      !isErrorphone &&
                      !isErrorpwd &&
                      !isErrorname) {
                    await crearUsuario();
                    if (!isError) {
                      rLogin();
                    }
                  }
                }
              }
            }
          },
          backgroundColor: Colors.white,
          child: Text(
            S.of(context).register_button,
            style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
          )),
    );
  }

  Column txtvalidaciones() {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: ccolor(4)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).register_condition_1,
              style: TextStyle(
                  fontFamily: 'Inter', color: ccolor(4), fontSize: 18),
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: ccolor(1)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).register_condition_2,
              style: TextStyle(
                  fontFamily: 'Inter', color: ccolor(1), fontSize: 18),
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: ccolor(2)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).register_condition_3,
              style: TextStyle(
                  fontFamily: 'Inter', color: ccolor(2), fontSize: 18),
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: ccolor(3)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).register_condition_4,
              style: TextStyle(
                  fontFamily: 'Inter', color: ccolor(3), fontSize: 18),
            )
          ],
        ),
      ],
    );
  }

  Container celularbox() {
    return Container(
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
                phoneError = S.of(context).register_error_phone_1;
              });
              return null;
            }
            if (x == 2 || x == 3) {
              setState(() {
                isErrorphone = true;
                phoneError = S.of(context).register_error_phone_2;
              });
              return null;
            }
            setState(() {
              isErrorphone = false;
            });
            return null;
          },
          controller: phone,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Inter', fontSize: 18),
          keyboardType: TextInputType.phone,
          maxLength: 10, // Alinea el texto al centro
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Colors.red),
            hintStyle: const TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
            border: InputBorder.none,
            hintText: S.of(context).register_placeholder_phone,
            prefixIcon: const Icon(
              Icons.phone,
              color: Color.fromARGB(101, 255, 255, 255),
            ),
            counterText: "", // Elimina el contador de longitud
          ),
        ),
      ),
    );
  }

  Container confirmacionpwd() {
    return Container(
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
                    onChanged: (value) {
                      formpwd2.currentState!.validate();
                    },
                    controller: password2control,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'Inter', fontSize: 18),
                    obscureText: isVisiblebtn2,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.red),
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        hintText: S.of(context).register_placeholder_passwordvry,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(101, 255, 255, 255)),
                        prefixIcon: const Icon(Icons.lock_person_outlined,
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
                child: isVisiblebtn2
                    ? Image.asset(
                        'assets/eye.png',
                        color: const Color.fromARGB(101, 255, 255, 255),
                      )
                    : Image.asset(
                        'assets/eye-line.png',
                        color: const Color.fromARGB(101, 255, 255, 255),
                      ),
              ),
            )
          ],
        ));
  }

  Container pwdbox() {
    return Container(
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
                    onChanged: (value) {
                      formpwd.currentState!.validate();
                    },
                    controller: passwordcontrol,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'Inter', fontSize: 18),
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 10),
                      hintText: S.of(context).register_placeholder_password,
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                      prefixIcon: const Icon(Icons.lock_person_outlined,
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
                child: isVisible
                    ? Image.asset(
                        'assets/eye.png',
                        color: const Color.fromARGB(101, 255, 255, 255),
                      )
                    : Image.asset(
                        'assets/eye-line.png',
                        color: const Color.fromARGB(101, 255, 255, 255),
                      ),
              ),
            )
          ],
        ));
  }

  Container emailbox() {
    return Container(
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
                  emailError = S.of(context).register_error_email_1;
                });
                return null;
              }
              if (x == 1 || x == 3) {
                setState(() {
                  isErroremail = true;
                  emailError = S.of(context).register_error_email_2;
                });
                return null;
              }
              setState(() {
                isErroremail = false;
                emailError = "";
              });
              return null;
            },
            style: const TextStyle(
                color: Colors.white, fontFamily: 'Inter', fontSize: 18),
            controller: emailcontrol,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                errorStyle: const TextStyle(color: Colors.red),
                hintStyle: const TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
                border: InputBorder.none,
                hintText: S.of(context).register_placeholder_email,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color.fromARGB(101, 255, 255, 255),
                )),
          ),
        ),
      ),
    );
  }

  Container nombrebox() {
    return Container(
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
              if (name.text.isEmpty) {
                setState(() {
                  isErrorname = true;
                });
                return null;
              }
              List<String> nombre = name.text.split(" ");
              if (nombre.length >= 2) {
                setState(() {
                  isErrorname = true;
                });
              }
              bool v1 = value!.contains(RegExp(r'[0-9]'));
              if (v1) {
                setState(() {
                  isErrorname = true;
                });
                return null;
              }
              setState(() {
                isErrorname = false;
              });
              return null;
            },
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
            controller: name,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Color.fromARGB(101, 255, 255, 255)),
              prefixIcon: const Icon(
                Icons.account_box_rounded,
                color: Color.fromARGB(101, 255, 255, 255),
              ),
              border: InputBorder.none,
              hintText: S.of(context).regiter_placeholder_name,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> crearUsuario() async {
    var r = await Autenticar()
        .crearU(email: emailcontrol.text, pwd: password2control.text);
    if (r.isNotEmpty) {
      List<String> nombre = name.text.split(" ");
      if (r == 'nodata') {
        final perfs = Preferencias();
        Expositor expositor = Expositor(
            id: perfs.id,
            correo: emailcontrol.text,
            apellidos: nombre[1].toLowerCase(),
            celular: phone.text.toLowerCase(),
            nombre: nombre[0].toLowerCase(),
            ntf: true);
        InsertarDatos().setExpositor(expositor, perfs.id);
      } else {
        Expositor expositor = Expositor(
            id: '',
            correo: emailcontrol.text,
            apellidos: nombre[1].toLowerCase(),
            celular: phone.text.toLowerCase(),
            nombre: nombre[0].toLowerCase(),
            ntf: true);
        InsertarDatos().setExpositor(expositor, r);
      }
    } else {
      setState(() {
        isErroremail = true;
        isErrorpwd = true;
        isError = true;
      });
    }
  }

  Future<String?> rLogin() {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: Dialog(
              backgroundColor: const Color.fromARGB(255, 53, 53, 53),
              child: SizedBox(
                height: altura * .20,
                width: ancho * .30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/email-verificado.png'),
                    const FittedBox(
                      child: Text(
                        'Se ha enviado un correo de',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    const FittedBox(
                      child: Text(
                        'verificacion al correo colocado',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: altura * .015),
                    Container(
                      height: altura * .043,
                      width: ancho * .2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: FloatingActionButton(
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                        heroTag: 'dialogacpt',
                        elevation: 0,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text('Aceptar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
    } else if (x == 4) {
      if (passwordcontrol.text.isEmpty && !isErrorpwd) {
        return Colors.white;
      } else if (passwordcontrol.text.length >= 8) {
        return Colors.green;
      }
      return Colors.red;
    }
    return Colors.white;
  }

  @override
  void dispose() {
    emailcontrol.dispose();
    passwordcontrol.dispose();
    password2control.dispose();
    phone.dispose();
    name.dispose();
    super.dispose();
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
