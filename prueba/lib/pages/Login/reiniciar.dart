import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:prueba/Negocio/autenticar.dart';
import 'package:prueba/generated/l10n.dart';

class Reiniciar extends StatefulWidget {
  const Reiniciar({super.key});

  @override
  State<Reiniciar> createState() => _ReiniciarState();
}

class _ReiniciarState extends State<Reiniciar> {
  TextEditingController emailcontrol = TextEditingController();
  bool isErroremail = false;
  bool cn = false;
  final femail = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            ingreso(),
            velo(),
            confirmacion(),
          ],
        ),
      )),
    );
  }

  Container velo() {
    if (cn) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(1, 1, 1, .6),
      );
    }
    return Container();
  }

  Column ingreso() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        FittedBox(
          child: Text(
            S.of(context).reset_password_title,
            style: const TextStyle(
                fontFamily: 'Inter', fontSize: 25, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buttonregreso(),
        const SizedBox(
          height: 30,
        ),
        indicacion(),
        const SizedBox(
          height: 30,
        ),
        correo(),
        const SizedBox(
          height: 40,
        ),
        enviar()
      ],
    );
  }

  Widget enviar() {
    return SizedBox(
      width: 400,
      height: 50,
      child: FloatingActionButton(
        onPressed: (() async {
          femail.currentState!.validate();
          if (!isErroremail) {
            bool r = await Autenticar().reiniciarc(emailcontrol.text);
            if (r) {
              central(r);
            }
          }
        }),
        backgroundColor: Colors.white,
        child: Text(
          S.of(context).button_send,
          style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
        ),
      ),
    );
  }

  void central(bool r) {
    FocusScope.of(context).unfocus();
    setState(() {
      cn = r;
    });
  }

  Center confirmacion() {
    if (cn) {
      return Center(
        heightFactor: 3,
        child: Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(216, 53, 53, 53)),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/checkg.png'),
              const SizedBox(
                height: 35,
              ),
              Center(
                child: FittedBox(
                  child: Text(
                    S.of(context).reset_dialog_text_1,
                    style: const TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: FittedBox(
                  child: Text(
                    S.of(context).reset_dialog_text_2,
                    style: const TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: FloatingActionButton(
                  heroTag: 'cn',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                  child: Text(
                    S.of(context).reset_dialog_button,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const Center();
  }

  Container correo() {
    return Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(115, 87, 87, 94),
            border: Border.all(
                color: isErroremail
                    ? Colors.red
                    : const Color.fromARGB(0, 87, 87, 94))),
        child: SizedBox(
          width: 380,
          height: 35,
          child: Form(
              key: femail,
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
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 12),
                    hintText: S.of(context).placeholder_box_email,
                    hintStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        color: Color.fromARGB(101, 255, 255, 255)),
                    prefixIcon: const Icon(Icons.email_outlined,
                        color: Color.fromARGB(101, 255, 255, 255)),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none),
              )),
        ));
  }

  Center indicacion() {
    return Center(
        child: Column(
      children: [
        FittedBox(
          child: Text(
            S.of(context).reset_password_subtitle_1,
            style: const TextStyle(
                fontFamily: 'Inter', fontSize: 20, color: Colors.white),
          ),
        ),
        FittedBox(
          child: Text(
            S.of(context).reset_password_subtitle_2,
            style: const TextStyle(
                fontFamily: 'Inter', fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    ));
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

  @override
  void dispose() {
    emailcontrol.dispose();
    super.dispose();
  }
}
