// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login to your account`
  String get title_is {
    return Intl.message(
      'Login to your account',
      name: 'title_is',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back! Please enter your data`
  String get subtitle_1 {
    return Intl.message(
      'Welcome back! Please enter your data',
      name: 'subtitle_1',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get title_box_email {
    return Intl.message(
      'Email',
      name: 'title_box_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get placeholder_box_email {
    return Intl.message(
      'Enter your email',
      name: 'placeholder_box_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get title_box_pwd {
    return Intl.message(
      'Password',
      name: 'title_box_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get placeholder_box_pwd {
    return Intl.message(
      'Enter your password',
      name: 'placeholder_box_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Forget your password?`
  String get forget {
    return Intl.message(
      'Forget your password?',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get title_box_enter {
    return Intl.message(
      'login',
      name: 'title_box_enter',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get subtitle_enter {
    return Intl.message(
      'or',
      name: 'subtitle_enter',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get not_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'not_account',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get register {
    return Intl.message(
      'Signup',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get message_error_login {
    return Intl.message(
      'Incorrect email or password',
      name: 'message_error_login',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tittle_settings {
    return Intl.message(
      'Settings',
      name: 'tittle_settings',
      desc: '',
      args: [],
    );
  }

  /// `App`
  String get subtitle_box_app {
    return Intl.message(
      'App',
      name: 'subtitle_box_app',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get subtitle_app_lang {
    return Intl.message(
      'Language',
      name: 'subtitle_app_lang',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get subtitle_app_noti {
    return Intl.message(
      'Notifications',
      name: 'subtitle_app_noti',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get subtitle_box_account {
    return Intl.message(
      'Account',
      name: 'subtitle_box_account',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get subtitle_account_profile {
    return Intl.message(
      'Profile',
      name: 'subtitle_account_profile',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get subtitle_account_password {
    return Intl.message(
      'Password',
      name: 'subtitle_account_password',
      desc: '',
      args: [],
    );
  }

  /// `Policy, Terms and Conditions`
  String get subtitle_box_policy {
    return Intl.message(
      'Policy, Terms and Conditions',
      name: 'subtitle_box_policy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get subtitle_policy_privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'subtitle_policy_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get subtitle_policy_term {
    return Intl.message(
      'Terms and Conditions',
      name: 'subtitle_policy_term',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get title_signout {
    return Intl.message(
      'Sign out',
      name: 'title_signout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'MX'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
