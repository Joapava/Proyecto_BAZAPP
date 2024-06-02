import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Services/bloc/notificaciones_bloc.dart';
import 'package:prueba/inicio.dart';
import 'firebase_options.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferencias.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => NotificacionesBloc(),
      ),
    ],
    child: BazzApp(),
  ));
}

class BazzApp extends StatelessWidget {
  BazzApp({super.key});

  final perfs = Preferencias();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Bazz App",
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}
