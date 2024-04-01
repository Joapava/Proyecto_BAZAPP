// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:prueba/pages/pagina_inicio.dart';
import 'package:prueba/pages/pagina_noticias.dart';
import 'package:prueba/pages/pagina_comunidad.dart';
//import 'package:prueba/pages/pagina_puestos.dart';

const Color colorBarra =Color.fromRGBO(3, 48, 53, 1.0);

class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({super.key});

  @override
  State<BarraNavegacion> createState() => _BarraNavegacionState();
}



class _BarraNavegacionState extends State<BarraNavegacion> {

   int indiceSeleccionado = 0;

  final paginas = [
    const PaginaInicio(),
    const paginaComunidad(),
    const paginaNoticias(),
    const Text("Hola"), //PaginaPuestos()
    const Center(child: Text("Perfil")),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: paginas[indiceSeleccionado],
      bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: colorBarra.withOpacity(0.3), // Shadow color with some transparency
                                       blurRadius: 10,
                                       offset: const Offset(0, 20),
                )]
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child:GNav(
                                      selectedIndex: indiceSeleccionado,
                                      onTabChange: (index) => {
                      setState(() => indiceSeleccionado = index) 
                                      },
                      
                                      backgroundColor: const Color.fromRGBO(3, 48, 53, 1.0),
                                      color: const Color.fromRGBO(168, 169, 171,1.0),
                                      activeColor: const Color.fromRGBO(168, 169, 171,1.0),
                                      tabBackgroundColor: const Color.fromRGBO(242, 248, 248,0.2) ,
                                      tabBorderRadius: 100,
                                      tabMargin: const EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.all(10),
                                      gap: 8,
                                      tabs: const [
                        GButton(icon: Icons.home_outlined,
                                text: "Inicio"),
                        GButton(icon: Icons.groups_outlined,
                                text: "Comunidad",),
                        GButton(icon: Icons.newspaper_outlined,
                                text: "Noticias",),
                        GButton(icon: Icons.location_on_outlined,
                                text: "Locación",),
                        // GButton(icon: Icons.notifications_outlined),
                        GButton(icon: Icons.account_circle_outlined,
                                text: "Cuenta"),
                                    
                                    ],
                                  ),
                    ),
            ),
          ),
        );
  }
}