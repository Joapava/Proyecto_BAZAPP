import 'package:flutter/material.dart';
import 'package:prueba/Negocio/autenticar.dart';
import 'package:prueba/generated/l10n.dart';
import 'package:prueba/pages/config/configuracion.dart';
import 'package:prueba/pages/home/pagina_inicio.dart';
import 'package:prueba/pages/home/pagina_noticias.dart';
import 'package:prueba/pages/home/pagina_puestos.dart';

class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({super.key});

  @override
  BarraNavegacionState createState() => BarraNavegacionState();
}

class BarraNavegacionState extends State<BarraNavegacion> {
  int _indiceSeleccionado = 0;
  final List<Widget> _paginas = [
    const PaginaInicio(),
    const PaginaNoticias(),
    const PaginaPuestos(),
    const Configuracion(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _indiceSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas.elementAt(_indiceSeleccionado),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 19, 21, 1.0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildNavBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildNavBarItems() {
    return [
            navBarItem(
                S.of(context).navbar_item_home, 'lib/images/home.png', 0),
            navBarItem(
                S.of(context).navbar_item_news, 'lib/images/news.png', 1),
            navBarItem(
                S.of(context).navbar_item_locate, 'lib/images/location.png', 2),
            navBarItem(
                S.of(context).navbar_item_user, 'lib/images/profile.png', 3),
          ];
  }

  Widget navBarItem(String label, String imagePath, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Image.asset(imagePath, width: 30, height: 30),
          ),
          Text(label,
              style: TextStyle(
                  color: index == _indiceSeleccionado
                      ? const Color.fromRGBO(255, 255, 255, 1)
                      : const Color.fromRGBO(113, 113, 113, 1.0),
                  fontFamily: "inter")),
        ],
      ),
    );
  }

}
