import 'package:flutter/material.dart';
import 'package:prueba/components/barra_cuenta.dart';
import 'package:prueba/data/comunidad-data.dart';


class paginaComunidad extends StatefulWidget {
  const paginaComunidad({super.key});

  @override
  State<paginaComunidad> createState() => _paginaComunidadState();
}

class _paginaComunidadState extends State<paginaComunidad> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
            body:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const barraCuenta(),
                    const Divider(),
                    vistaAgrupadaPorGiroPuesto(),
                                      ],
            ) ,
    );
  }
}

Widget formatoPresentacion(String urlImagenPerfil, String nombrePerfil, String profesion, String informacionPuesto ) {
  return Container(
    width: 170,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: const BoxDecoration(
      color: Color.fromRGBO(168, 169, 171, 0.5),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(urlImagenPerfil),
                ),
              ),
            ),

            Expanded( // Asegúrate de que este Container pueda expandirse para llenar el espacio
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea los textos a la izquierda
                  children: <Widget>[
                    Text(
                      nombrePerfil,
                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    Text(profesion,style: const TextStyle(fontSize: 12)), // El texto "data" ahora está debajo de "Nombre perfil"
                  ],
                ),
              ),
            ),
          ],
        ),

        Text(informacionPuesto,style: const TextStyle(fontSize: 12))
      ],
    ),
  );
}

Widget listaFormatoPuestos(List<FormatoPuesto> formatos) {
  return Wrap(
    direction: Axis.horizontal,
    spacing: 1,
    runSpacing: 1,
    children: List<Widget>.generate(formatos.length, (index) {
      FormatoPuesto formatoPuesto = formatos[index];
      return formatoPresentacion(
        formatoPuesto.urlImagenPerfil,
        formatoPuesto.nombrePerfil,
        formatoPuesto.profesion,
        formatoPuesto.informacionPuesto,
      );
    }),
  );
}

Widget contenedorListaFormatoPuesto(String giroPuesto, List<FormatoPuesto> formatos) {
  return Container(
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromRGBO(168, 169, 171, 0.2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(giroPuesto, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: listaFormatoPuestos(formatos),
        ),
      ],
    ),
  );
}


Widget vistaAgrupadaPorGiroPuesto() {
  // Agrupar los FormatoPuesto por giroPuesto.
  Map<String, List<FormatoPuesto>> agrupadosPorGiro = {};
  for (var formato in formatosPuesto) {
    agrupadosPorGiro.putIfAbsent(formato.giroPuesto, () => []).add(formato);
  }

  // Crear un contenedor para cada giroPuesto.
  List<Widget> contenedores = [];
  agrupadosPorGiro.forEach((giroPuesto, formatos) {
    contenedores.add(contenedorListaFormatoPuesto(giroPuesto, formatos));
  });

  return Column(
    children: contenedores,
  );
}
