import 'package:flutter/material.dart';
import 'package:prueba/Persistencia/Preferencias.dart';
import 'package:prueba/pages/configuracion.dart';
import 'package:prueba/pages/configuracion_admin.dart';
import 'package:prueba/pages/pagina_inicio.dart';
import 'package:prueba/pages/pagina_noticias.dart';
import 'package:prueba/pages/pagina_puestos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BarraNavegacion(),
    );
  }
}

class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({Key? key}) : super(key: key);

  @override
  _BarraNavegacionState createState() => _BarraNavegacionState();
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  int _indiceSeleccionado = 0;

  final List<Widget> _paginas = [
    const PaginaInicio(),
    const PaginaNoticias(),
    const PaginaPuestos(),
  ];

  @override
  void initState() {
    _paginasadd();
    super.initState();
  }

  void _paginasadd(){
    final perfs = Preferencias();
    if(perfs.lvl == 2){
      _paginas.add(const ConfiguracionAdmin());
    } else{
      _paginas.add(const Configuracion());
    }
  }

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
          color:  Color.fromRGBO(18, 19, 21, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13)
          ),
          boxShadow:  [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navBarItem('Inicio', 'lib/images/home.png', 0),
            navBarItem('Noticias', 'lib/images/news.png', 1),
            navBarItem('Ubicación', 'lib/images/location.png', 2),
            navBarItem('Usuario', 'lib/images/profile.png', 3),
          ],
        ),
      ),
    );
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
          Text(label, style: TextStyle(color: index == _indiceSeleccionado ? const Color.fromRGBO(255, 255, 255, 1) : const Color.fromRGBO(113, 113, 113, 1.0), fontFamily: "inter")),
        ],
      ),
    );
  }
}
