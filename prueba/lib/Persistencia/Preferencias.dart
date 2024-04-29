// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set nombre(String nombre) {
    _prefs.setString('nombre', nombre);
  }

  set email(String email) {
    _prefs.setString('email', email);
  }

  set id(String id) {
    _prefs.setString('id', id);
  }

  set phone(String phone) {
    _prefs.setString('phone', phone);
  }

  set lenguaje(String lenguaje) {
    _prefs.setString('lenguaje', lenguaje);
  }

  set notificaciones(bool ntf) {
    _prefs.setBool('ntf', ntf);
  }

  set variable(bool ntf){
    _prefs.setBool('var', ntf);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? 'Not found';
  }

  String get email {
    return _prefs.getString('email') ?? 'Not found';
  }

  String get id {
    return _prefs.getString('id') ?? '';
  }

  String get phone {
    return _prefs.getString('phone') ?? 'Not found';
  }

  String get lenguaje {
    return _prefs.getString('lenguaje') ?? 'es_MX';
  }

  bool get notificaciones {
    return _prefs.getBool('ntf') ?? false;
  }

  bool get variable{
    return _prefs.getBool('var') ?? false;
  }

  void clear() {
    _prefs.clear();
  }
}
