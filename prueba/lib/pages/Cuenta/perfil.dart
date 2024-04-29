import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:prueba/Negocio/EditarDatos.dart';
import 'package:prueba/Negocio/ValidarDatos.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

class Perfil extends StatefulWidget {
  final Preferencias perfs;

  const Perfil({super.key, required this.perfs});

  @override
  State<Perfil> createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  final formname = GlobalKey<FormState>();
  final formphone = GlobalKey<FormState>();
  final formemail = GlobalKey<FormState>();
  late final phonecontrol = TextEditingController(text: widget.perfs.phone);
  late final namecontrol = TextEditingController(text: widget.perfs.nombre);
  late final emailcontrol = TextEditingController(text: widget.perfs.email);
  final perfs = Preferencias();
  bool editname = true;
  bool isErrorname = false;
  bool editphone = true;
  bool isErrorphone = false;
  bool editemail = true;
  bool isErroremail = false;
  FocusNode namefocus = FocusNode();
  FocusNode phonefocus = FocusNode();
  FocusNode emailfocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(child: SingleChildScrollView(child: principal())),
    );
  }

  Widget principal() {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Center(
          child: FittedBox(
            child: Text(
              'Perfil',
              style: TextStyle(fontFamily: 'Inter', fontSize: 24),
            ),
          ),
        ),
        buttonregreso(),
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [
            SizedBox(
              width: 30,
            ),
            FittedBox(
              child: Text(
                'Nombre',
                style: TextStyle(fontFamily: 'Inter', fontSize: 20),
              ),
            ),
          ],
        ),
        name(),
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [
            SizedBox(
              width: 30,
            ),
            FittedBox(
              child: Text(
                'Correo',
                style: TextStyle(fontFamily: 'Inter', fontSize: 20),
              ),
            )
          ],
        ),
        email(),
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [
            SizedBox(
              width: 30,
            ),
            FittedBox(
              child: Text(
                'Celular',
                style: TextStyle(fontFamily: 'Inter', fontSize: 20),
              ),
            ),
          ],
        ),
        phone()
      ],
    );
  }

  Container name() {
    return Container(
      width: 400,
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
              color:
                  isErrorname ? Colors.red : const Color.fromRGBO(0, 0, 0, 0))),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 300,
            height: 40,
            child: Form(
                key: formname,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        isErrorname = true;
                      });
                      return null;
                    }
                    List<String> nombre = namecontrol.text.split(" ");
                    if (nombre.length < 2) {
                      setState(() {
                        isErrorname = true;
                      });
                      return null;
                    }
                    bool v1 = value.contains(RegExp(r'[0-9]'));
                    if (nombre.length >= 2 && v1) {
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
                  focusNode: namefocus,
                  onFieldSubmitted: (value) {
                    nuevonombre();
                    setState(() {
                      if (!isErrorname) {
                        editname = true;
                      }
                    });
                  },
                  readOnly: editname,
                  controller: namecontrol,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsetsDirectional.symmetric(),
                      prefixIcon: ImageIcon(AssetImage('assets/icon-name.png')),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
                )),
          ),
          const SizedBox(
            width: 45,
          ),
          SizedBox(width: 35, height: 35, child: buttomedit(1))
        ],
      ),
    );
  }

  Container phone() {
    return Container(
      width: 400,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
              color: isErrorphone
                  ? Colors.red
                  : const Color.fromRGBO(0, 0, 0, 0))),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 300,
            height: 40,
            child: Form(
                key: formphone,
                child: TextFormField(
                  validator: (value) {
                    if (value!.length <= 9) {
                      setState(() {
                        isErrorphone = true;
                      });
                      return null;
                    }
                    setState(() {
                      isErrorphone = false;
                    });
                    return null;
                  },
                  focusNode: phonefocus,
                  onFieldSubmitted: (String value) async{
                    await validar(2);
                    setState(() {
                      if (!isErrorphone) {
                        editphone = true;
                      }
                    });
                    nuevophone();
                  },
                  readOnly: editphone,
                  keyboardType: TextInputType.phone,
                  // initialValue: phonecontrol.text.isEmpty ? perfs.phone : '',
                  controller: phonecontrol,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsetsDirectional.symmetric(),
                      prefixIcon:
                          ImageIcon(AssetImage('assets/icon-phone.png')),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
                )),
          ),
          const SizedBox(
            width: 45,
          ),
          SizedBox(
            width: 35,
            height: 35,
            child: buttomedit(2),
          )
        ],
      ),
    );
  }

  Container email() {
    return Container(
      width: 400,
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
              color: isErroremail
                  ? Colors.red
                  : const Color.fromRGBO(0, 0, 0, 0))),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 300,
            height: 40,
            child: Form(
                key: formemail,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: emailcontrol,
                  focusNode: emailfocus,
                  validator: (value) {
                    if (!EmailValidator.validate(emailcontrol.text)) {
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
                  onFieldSubmitted: (value) async {
                    await validar(1);
                    setState(() {
                      if (!isErroremail) {
                        editemail = true;
                      }
                    });
                    nuevoemail();
                  },
                  readOnly: editemail,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsetsDirectional.symmetric(),
                      prefixIcon: Icon(Icons.alternate_email),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
                )),
          ),
          const SizedBox(
            width: 45,
          ),
          SizedBox(width: 35, height: 35, child: buttomedit(3))
        ],
      ),
    );
  }

  Widget buttomedit(int x) {
    if (x == 1) {
      return FloatingActionButton(
        heroTag: 'edit_name',
        onPressed: () {
          if (editname) {
            setState(() {
              editname = false;
              FocusScope.of(context).requestFocus(namefocus);
            });
          } else {
            formname.currentState!.validate();
            if (!isErrorname) {
              setState(() {
                editname = true;
              });
              nuevonombre();
            }
          }
        },
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        child: editname ? const Icon(Icons.edit) : const Icon(Icons.check),
      );
    } else if (x == 2) {
      return FloatingActionButton(
        heroTag: 'edit_phone',
        onPressed: () async{

          if (editphone) {
            setState(() {
              editphone = false;
              FocusScope.of(context).requestFocus(phonefocus);
            });
          } else {
            await validar(2);
            if (!isErrorphone) {
              setState(() {
                editphone = true;
              });
              nuevophone();
            }
          }
        },
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        child: editphone
            ? const Icon(Icons.edit)
            : const Icon(Icons.check_rounded),
      );
    } else if (x == 3) {
      return FloatingActionButton(
        heroTag: 'edit_email',
        onPressed: () async {
          if (editemail) {
            setState(() {
              editemail = false;
              FocusScope.of(context).requestFocus(emailfocus);
            });
          } else {
            await validar(1);
            if (!isErroremail) {
              setState(() {
                editemail = true;
              });
              nuevoemail();
            }
          }
        },
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        child: editemail
            ? const Icon(Icons.edit)
            : const Icon(Icons.check_rounded),
      );
    }
    return const SizedBox();
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
              // dispose();
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

  void nuevonombre() {
    formname.currentState!.validate();
    if (!isErrorname) {
      List<String> nombre = namecontrol.text.split(" ");
      String nombrec = "${nombre[0]} ${nombre[1]}";
      if (perfs.nombre == nombrec) {
        setState(() {
          editname = true;
        });
      } else {
        EditarDatos().cambiarnombre(perfs.id, nombre[0], nombre[1]);
        String apellido = nombre[1];
        apellido = apellido[0].toUpperCase() + apellido.substring(1);
        nombrec = "${nombre[0]} $apellido";
        perfs.nombre = nombrec;
        setState(() {
          editname = true;
        });
      }
    }
  }

  void nuevophone() {
    if (!isErrorphone) {
      if (perfs.phone == phonecontrol.text) {
        setState(() {
          editphone = true;
        });
      } else {
        perfs.phone = phonecontrol.text;
        EditarDatos().cambiarcelular(perfs.id, perfs.phone);
        setState(() {
          editphone = true;
        });
      }
    }
  }

  void nuevoemail() async{
    if (!isErroremail) {
      if (perfs.email == emailcontrol.text) {
        setState(() {
          editemail = true;
        });
      } else {
        perfs.email = emailcontrol.text;
        EditarDatos().cambiarcorreo(perfs.id, perfs.email);
        setState(() {
          editemail = true;
        });
      }
    } 
  }

  Future<void> validar(int x) async {
    if (x == 1) {
      formemail.currentState!.validate();
      bool isRegister = await ValidarDatos().registroemail(emailcontrol.text);
      if (isRegister && !isErroremail) {
        if (perfs.email == emailcontrol.text) {
          setState(() {
            isErroremail = false;
          });
          // nuevoemail();
        } else {
          setState(() {
            isErroremail = true;
          });
        }
      } else if(isErroremail){
        setState(() {
          isErroremail = true;
        });
      } else {
        setState(() {
          isErroremail = false;
        });
      }
    } else if (x == 2) {
      formphone.currentState!.validate();
      bool isRegister = await ValidarDatos().registrocelular(phonecontrol.text);
      if (isRegister && !isErrorphone) {
        if (perfs.phone == phonecontrol.text) {
          setState(() {
            isErrorphone = false;
          });
          // nuevoemail();
        } else {
          setState(() {
            isErrorphone = true;
          });
        }
      } else if(isErrorphone){
        setState(() {
          isErrorphone = true;
        });
      } else {
        setState(() {
          isErrorphone = false;
        });
      }
    }
  }

  @override
  void dispose() {
    namecontrol.dispose();
    phonecontrol.dispose();
    emailcontrol.dispose();
    super.dispose();
  }
}
