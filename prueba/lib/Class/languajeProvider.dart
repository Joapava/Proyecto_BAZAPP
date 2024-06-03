import 'dart:ui';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  late Locale _locale;

  LanguageProvider() {
    _locale = Locale(PlatformDispatcher.instance.locale.languageCode);
  }

  Locale get locale => _locale;

  void switchLanguage(String lang) {
    _locale = Locale(lang);
    notifyListeners();
  }

}
