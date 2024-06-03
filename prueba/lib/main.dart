import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prueba/Services/bloc/notificaciones_bloc.dart';
import 'package:prueba/generated/l10n.dart';
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
    child: const BazzApp(),
  ));
}

class BazzApp extends StatefulWidget {
  const BazzApp({super.key});

  @override
  State<BazzApp> createState() => BazzAppState();
}

class BazzAppState extends State<BazzApp> {
  final perfs = Preferencias();
  


  @override
  void initState() {
    S.load(Locale('es', 'MX'));
    super.initState();
  }

  void changelang(Locale lang) {
    setState(() {
      
      S.load(lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bazz App",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const Inicio(),
    );
  }
}
