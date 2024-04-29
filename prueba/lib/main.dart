import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba/pages/inicio.dart';
import 'package:prueba/pages/login.dart';
import 'firebase_options.dart';
import 'package:prueba/Persistencia/Preferencias.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferencias.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BazzApp());
}

class BazzApp extends StatelessWidget {
  BazzApp({super.key});

  final perfs = Preferencias();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bazz App",
      debugShowCheckedModeBanner: false,
      initialRoute: perfs.id.isEmpty? 'Login' : 'Home',
      routes: {
        'Login' :(context) => const Login(),
        'Home' :(context) => const Inicio()
      },
    );
  }
}
