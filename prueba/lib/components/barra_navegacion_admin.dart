import 'package:flutter/material.dart';
import 'package:prueba/pages/config/configuracion_admin.dart';
import 'package:prueba/pages/home/pagina_inicio_admin.dart';
import 'package:prueba/pages/home/pagina_noticias.dart';
import 'package:prueba/pages/home/pagina_puestos.dart';
import 'package:prueba/pages/home/pagina_avisos_admin.dart';
import 'package:prueba/pages/home/estadisticas.dart'; // Asegúrate de importar la página de analítica
import 'package:prueba/generated/l10n.dart';

class BarraNavegacionAdmin extends StatefulWidget {
  const BarraNavegacionAdmin({super.key});

  @override
  _BarraNavegacionAdminState createState() => _BarraNavegacionAdminState();
}

class _BarraNavegacionAdminState extends State<BarraNavegacionAdmin> {
  int _indiceSeleccionado = 0;
  final List<Widget> _paginas = [
    const PaginaInicioAdmin(),
    const PaginaNoticias(),
    const PaginaAvisosAdmin(),
    const PaginaPuestos(),
    const MenuAdmin(),
    const ConfiguracionAdmin(),
    // Añade la página de analítica
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
      navBarItem(S.of(context).navbar_item_home, 'lib/images/home.png', 0),
      navBarItem(S.of(context).navbar_item_news, 'lib/images/news.png', 1),
      navBarItem(S.of(context).navbar_item_alerts, 'lib/images/alerta.png', 2),
      navBarItem(
          S.of(context).navbar_item_locate, 'lib/images/location.png', 3),
      navBarItem(S.of(context).navbar_item_stacs, 'lib/images/analitica.png', 4),
      navBarItem(S.of(context).navbar_item_user, 'lib/images/profile.png', 5),
      // Añade el nuevo ítem
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
