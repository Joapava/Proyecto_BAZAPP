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

  set admin(String id){
    _prefs.setString('id_admin', id);
  }

  set lvl(int x){
    _prefs.setInt('lvl', x);
  }

  set token(String token){
    _prefs.setString('token', token);
  }

  set type(String type){
    _prefs.setString('type', type);
  }

  set price(int x){
    _prefs.setInt('price', x);
  }

  set nameBazar(String name){
    _prefs.setString('nameBazar', name);
  }

  set idBazar(String id){
    _prefs.setString('idBazar', id);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  String get email {
    return _prefs.getString('email') ?? '';
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

  String get idadmin{
    return _prefs.getString('id_admin') ?? 'Not found';
  }

  int get lvl{
    return _prefs.getInt('lvl') ?? 0;
  }

  String get token{
    return _prefs.getString('token') ?? '';
  }

  String get type{
    return _prefs.getString('type') ?? 'Not found';
  }

  int get price{
    return _prefs.getInt('price') ?? 0;
  }

  String get idBazar{
    return _prefs.getString('idBazar') ?? 'Not found';
  }

  String get nameBazar{
    return _prefs.getString('nameBazar') ?? 'Not Found';
  }

  void clear() {
    _prefs.clear();
  }
}
