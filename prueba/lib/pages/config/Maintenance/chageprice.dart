import 'package:flutter/material.dart';
import 'package:prueba/Negocio/EditarDatos.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/generated/l10n.dart';

class ChangePrice extends StatefulWidget {
  const ChangePrice({super.key});

  @override
  State<ChangePrice> createState() => _ChangePriceState();
}

class _ChangePriceState extends State<ChangePrice> {
  Preferencias prefs = Preferencias();
  final _formprice = GlobalKey<FormState>();
  final TextEditingController _princecontrol = TextEditingController();
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, .98),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: altura * .025,
            ),
            Center(
              child: FittedBox(
                child: Text(
                  S.of(context).change_price_title,
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 20),
                ),
              ),
            ),
            buttonregreso(),
            SizedBox(
              height: altura * .2,
            ),
            boxcentral(),
          ],
        ),
      )),
    );
  }

  Widget boxcentral() {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Container(
      height: altura * .22,
      width: ancho * .8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: altura * .020,
          ),
          namesprices(),
          SizedBox(
            height: altura * .015,
          ),
          numbers(),
          SizedBox(
            height: altura * .045,
          ),
          buttonguardar()
        ],
      ),
    );
  }

  Container buttonguardar() {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Container(
      width: ancho * .65,
      height: altura * .03,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black),
      child: FloatingActionButton(
        heroTag: 'buttonsave',
        onPressed: () async {
          _formprice.currentState!.validate();
          if (_princecontrol.text.isNotEmpty) {
            int? price = int.tryParse(_princecontrol.text);
            if (price == null) {
              setState(() {
                isError = true;
              });
            } else {
              if (!isError) {
                if (price != prefs.price) {
                  EditarDatos().cambiarprecio(prefs.idBazar, price);
                  setState(() {
                    prefs.price = price;
                  });
                  
                  _mostrarDialogo(context);
                }
              }
            }
          }
        },
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        child: Text(
          S.of(context).button_save,
          style: const TextStyle(
              fontFamily: 'Inter', fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Row namesprices() {
    double ancho = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const SizedBox(
        //   width: 30,
        // ),
        SizedBox(
          width: ancho * .35,
          child: Center(
            child: Text(
              S.of(context).change_price_subtitle_1,
              style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          width: ancho * .4,
          child: Center(
            child: Text(
              S.of(context).change_price_subtitle_2,
              style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Row numbers() {
    Preferencias prefs = Preferencias();
    final TextEditingController actualprice = TextEditingController(text: '${prefs.price}');
    return Row(
      children: [
        const SizedBox(
          width: 50,
        ),
        SizedBox(
            width: 70,
            child: Form(
                child: TextFormField(
                  controller: actualprice,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    readOnly: true,
                    cursorWidth: 20,
                    enabled: false,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16)))),
        const SizedBox(
          width: 100,
        ),
        SizedBox(
            width: 70,
            child: Form(
                key: _formprice,
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      bool v1 = value.contains(RegExp(r','));
                      if (v1) {
                        setState(() {
                          isError = true;
                        });
                        return null;
                      }
                      if (value.isEmpty) {
                        setState(() {
                          isError = true;
                        });
                        return null;
                      }
                    }
                    setState(() {
                      isError = false;
                    });
                    return null;
                  },
                  onChanged: (value) {
                    _formprice.currentState!.validate();
                  },
                  controller: _princecontrol,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  // enabled: false,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Inter', fontSize: 16),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: isError ? Colors.red : Colors.purple,
                            width: 2),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: isError ? Colors.red : Colors.purple,
                            width: 1),
                      )),
                ))),
      ],
    );
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
                    Image.asset('assets/change-price.png',color: Colors.green[200],),
                    SizedBox(
                      height: altura * .010,
                    ),
                    FittedBox(
                      child: Text(
                        S.of(context).change_price_alert,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        S.of(context).change_price_alert_2,
                        style: const TextStyle(
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
                        child: Text(S.of(context).alert_button),
                      ),
                    ),
                  ],
                ),
              ),
            );
      },
    );
  }

  @override
  void dispose(){
    _princecontrol.dispose();
    super.dispose();
  }
}
