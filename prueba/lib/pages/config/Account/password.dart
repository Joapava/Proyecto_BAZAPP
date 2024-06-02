import 'package:flutter/material.dart';
import 'package:prueba/Negocio/autenticar.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/pages/Login/login.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final perfs = Preferencias();
  bool isVisiblepwd2 = true;
  bool isVisiblepwd3 = true;
  bool isErrorpwd2 = false;
  bool isErrorpwd3 = false;
  TextEditingController pwd2control = TextEditingController();
  TextEditingController pwd3control = TextEditingController();
  final formpwd = GlobalKey<FormState>();
  final formpwd2 = GlobalKey<FormState>();
  final formpwd3 = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (perfs.type == 'google') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mostrarDialogo(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(child: principal()),
    );
  }

  _mostrarDialogo(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
              backgroundColor: const Color.fromARGB(255, 53, 53, 53),
              child: SizedBox(
                height: altura * .25,
                width: ancho * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/advertencia.png',color: Colors.yellow[300],),
                    SizedBox(
                      height: altura * .010,
                    ),
                    const FittedBox(
                      child: Text(
                        'Al iniciar sesion con google',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    const FittedBox(
                      child: Text(
                        'tendra que cambiar su contraseña',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const FittedBox(
                      child: Text(
                        'desde ajustes de google',
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
                          Navigator.pop(context);
                        },
                        child: const Text('Aceptar'),
                      ),
                    ),
                  ],
                ),
              ),
            );
      },
    );
  }

  Column principal() {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        const Center(
          child: FittedBox(
            child: Text(
              'Cambiar Contraseña',
              style: TextStyle(fontFamily: 'Inter', fontSize: 20),
            ),
          ),
        ),
        buttonregreso(),
        const SizedBox(
          height: 60,
        ),
        nuevapwd(),
        const SizedBox(
          height: 20,
        ),
        condiciones(),
        const SizedBox(
          height: 40,
        ),
        buttonguardar(),
      ],
    );
  }

  Container buttonguardar() {
    if (perfs.type == 'google') {
      return Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[700]),
        child: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.grey[700],
          child: const Text(
            'Guardar',
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 18, color: Colors.white),
          ),
        ),
      );
    }
    return Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black),
      child: FloatingActionButton(
        onPressed: () {
          if (!isErrorpwd2 && !isErrorpwd3) {
            Autenticar().cambiarpwd(pwd3control.text);
            perfs.clear();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Login()));
          }
        },
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        child: const Text(
          'Guardar',
          style:
              TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget condiciones() {
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
                  borderRadius: BorderRadius.circular(15), color: colorc(1)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Incluir minimo un numero',
              style: TextStyle(
                  fontFamily: 'Inter', color: colorc(1), fontSize: 18),
            ),
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
                  borderRadius: BorderRadius.circular(15), color: colorc(2)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Incluir minimo una letra mayuscusla',
              style: TextStyle(
                  fontFamily: 'Inter', color: colorc(2), fontSize: 18),
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
                  borderRadius: BorderRadius.circular(15), color: colorc(3)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Longitud minima de 8',
              style: TextStyle(
                  fontFamily: 'Inter', color: colorc(3), fontSize: 18),
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
                  borderRadius: BorderRadius.circular(15), color: colorc(4)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Deben de coincidir las contraseñas',
              style: TextStyle(
                  fontFamily: 'Inter', color: colorc(4), fontSize: 18),
            )
          ],
        ),
      ],
    );
  }

  SizedBox nuevapwd() {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: 400,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                border: Border.all(
                    color: isErrorpwd2
                        ? Colors.red
                        : const Color.fromARGB(0, 87, 87, 94))),
            child: Row(
              children: [
                SizedBox(
                  width: 350,
                  height: 55,
                  child: Form(
                      key: formpwd2,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 8) {
                            setState(() {
                              isErrorpwd2 = true;
                            });
                            return null;
                          }
                          bool v1 = value.contains(RegExp(r'[0-9]'));
                          bool v2 = value.contains(RegExp(r'[A-Z]'));
                          if (!v1 && !v2 || v1 && !v2 || !v1 && v2) {
                            setState(() {
                              isErrorpwd2 = true;
                            });
                            return null;
                          }
                          setState(() {
                            isErrorpwd2 = false;
                          });
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            colorc(1);
                            colorc(2);
                            colorc(3);
                            colorc(4);
                          });
                        },
                        controller: pwd2control,
                        obscureText: isVisiblepwd2,
                        style:
                            const TextStyle(fontFamily: 'Inter', fontSize: 18),
                        decoration: const InputDecoration(
                            hintText: 'Contraseña nueva',
                            contentPadding: EdgeInsets.only(top: 10),
                            prefixIcon: Icon(Icons.password_rounded),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      )),
                ),
                SizedBox(
                    width: 45,
                    height: 45,
                    child: FloatingActionButton(
                      heroTag: 'pwd2',
                      onPressed: () {
                        setState(() {
                          if (!isVisiblepwd2) {
                            isVisiblepwd2 = true;
                          } else {
                            isVisiblepwd2 = false;
                          }
                        });
                      },
                      backgroundColor: const Color.fromARGB(0, 87, 87, 95),
                      elevation: 0,
                      child: isVisiblepwd2
                          ? Image.asset('assets/eye.png')
                          : Image.asset('assets/eye-line.png'),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 400,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                border: Border.all(
                    color: isErrorpwd3
                        ? Colors.red
                        : const Color.fromARGB(0, 87, 87, 94))),
            child: Row(
              children: [
                SizedBox(
                  width: 350,
                  height: 55,
                  child: Form(
                      key: formpwd3,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            colorc(4);
                          });
                        },
                        controller: pwd3control,
                        obscureText: isVisiblepwd3,
                        style:
                            const TextStyle(fontFamily: 'Inter', fontSize: 18),
                        decoration: const InputDecoration(
                            hintText: 'Confirmar contraseña',
                            contentPadding: EdgeInsets.only(top: 10),
                            prefixIcon: Icon(Icons.password_rounded),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      )),
                ),
                SizedBox(
                    width: 45,
                    height: 45,
                    child: FloatingActionButton(
                      heroTag: 'pwd3',
                      onPressed: () {
                        setState(() {
                          if (!isVisiblepwd3) {
                            isVisiblepwd3 = true;
                          } else {
                            isVisiblepwd3 = false;
                          }
                        });
                      },
                      backgroundColor: const Color.fromARGB(0, 87, 87, 95),
                      elevation: 0,
                      child: isVisiblepwd3
                          ? Image.asset('assets/eye.png')
                          : Image.asset('assets/eye-line.png'),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Color colorc(int x) {
    if (x == 1) {
      if (pwd2control.text.isEmpty && !isErrorpwd2) {
        return Colors.black;
      } else if (RegExp(r'[0-9]').hasMatch(pwd2control.text)) {
        error(2);
        return Colors.green;
      }
      error(1);
      return Colors.red;
    } else if (x == 2) {
      if (pwd2control.text.isEmpty && !isErrorpwd2) {
        return Colors.black;
      } else if (RegExp(r'[A-Z]').hasMatch(pwd2control.text)) {
        error(2);
        return Colors.green;
      }
      error(1);
      return Colors.red;
    } else if (x == 3) {
      if (pwd2control.text.isEmpty && !isErrorpwd2) {
        return Colors.black;
      } else if (pwd2control.text.length >= 8) {
        error(2);
        return Colors.green;
      }
      error(1);
      return Colors.red;
    } else if (x == 4) {
      if (pwd2control.text.isEmpty &&
          !isErrorpwd2 &&
          pwd3control.text.isEmpty &&
          !isErrorpwd3) {
        return Colors.black;
      } else if (pwd2control.text == pwd3control.text) {
        setState(() {
          isErrorpwd3 = false;
        });
        return Colors.green;
      }
      setState(() {
        isErrorpwd3 = true;
      });
      return Colors.red;
    }
    return Colors.black;
  }

  void error(int x) {
    if (x == 1) {
      setState(() {
        isErrorpwd2 = true;
        isErrorpwd3 = true;
      });
    } else if (x == 2) {
      isErrorpwd2 = false;
      isErrorpwd3 = false;
    }
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

  @override
  void dispose() {
    pwd2control.dispose();
    pwd3control.dispose();
    super.dispose();
  }
}
