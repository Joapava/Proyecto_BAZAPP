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

  /// `Shopping history`
  String get buy_history {
    return Intl.message(
      'Shopping history',
      name: 'buy_history',
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

  /// `Mantenimiento`
  String get config_manage_title {
    return Intl.message(
      'Mantenimiento',
      name: 'config_manage_title',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get config_create_subtitle_noti {
    return Intl.message(
      'Notification',
      name: 'config_create_subtitle_noti',
      desc: '',
      args: [],
    );
  }

  /// `Change price (space)`
  String get config_manage_subtitle_changeprice {
    return Intl.message(
      'Change price (space)',
      name: 'config_manage_subtitle_changeprice',
      desc: '',
      args: [],
    );
  }

  /// `Space maintenance`
  String get config_manage_subtitle_spaces {
    return Intl.message(
      'Space maintenance',
      name: 'config_manage_subtitle_spaces',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get tittle_lang {
    return Intl.message(
      'Select language',
      name: 'tittle_lang',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_box {
    return Intl.message(
      'Search',
      name: 'search_box',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get buttom_cancel {
    return Intl.message(
      'Cancel',
      name: 'buttom_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navbar_item_home {
    return Intl.message(
      'Home',
      name: 'navbar_item_home',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get navbar_item_news {
    return Intl.message(
      'News',
      name: 'navbar_item_news',
      desc: '',
      args: [],
    );
  }

  /// `Ads`
  String get navbar_item_ads {
    return Intl.message(
      'Ads',
      name: 'navbar_item_ads',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get navbar_item_locate {
    return Intl.message(
      'Location',
      name: 'navbar_item_locate',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get navbar_item_resume {
    return Intl.message(
      'Summary',
      name: 'navbar_item_resume',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get navbar_item_user {
    return Intl.message(
      'User',
      name: 'navbar_item_user',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get title_regiter {
    return Intl.message(
      'Signup',
      name: 'title_regiter',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get regiter_subtitle_name {
    return Intl.message(
      'Name',
      name: 'regiter_subtitle_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get regiter_placeholder_name {
    return Intl.message(
      'Enter your name',
      name: 'regiter_placeholder_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get register_subtitle_email {
    return Intl.message(
      'Email',
      name: 'register_subtitle_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get register_placeholder_email {
    return Intl.message(
      'Enter your email',
      name: 'register_placeholder_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get register_subtitle_password {
    return Intl.message(
      'Password',
      name: 'register_subtitle_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get register_placeholder_password {
    return Intl.message(
      'Enter your password',
      name: 'register_placeholder_password',
      desc: '',
      args: [],
    );
  }

  /// `Verify password`
  String get register_subtitle_passwordvry {
    return Intl.message(
      'Verify password',
      name: 'register_subtitle_passwordvry',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get register_placeholder_passwordvry {
    return Intl.message(
      'Re-enter your password',
      name: 'register_placeholder_passwordvry',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get register_subtitle_phone {
    return Intl.message(
      'Phone',
      name: 'register_subtitle_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get register_placeholder_phone {
    return Intl.message(
      'Enter your phone',
      name: 'register_placeholder_phone',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 8 characters`
  String get register_condition_1 {
    return Intl.message(
      'Minimum 8 characters',
      name: 'register_condition_1',
      desc: '',
      args: [],
    );
  }

  /// `Include at least one number`
  String get register_condition_2 {
    return Intl.message(
      'Include at least one number',
      name: 'register_condition_2',
      desc: '',
      args: [],
    );
  }

  /// `Include at least one capital letter`
  String get register_condition_3 {
    return Intl.message(
      'Include at least one capital letter',
      name: 'register_condition_3',
      desc: '',
      args: [],
    );
  }

  /// `Passwords must match`
  String get register_condition_4 {
    return Intl.message(
      'Passwords must match',
      name: 'register_condition_4',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_button {
    return Intl.message(
      'Register',
      name: 'register_button',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get register_error_email_1 {
    return Intl.message(
      'Enter a valid email',
      name: 'register_error_email_1',
      desc: '',
      args: [],
    );
  }

  /// `Email already registered`
  String get register_error_email_2 {
    return Intl.message(
      'Email already registered',
      name: 'register_error_email_2',
      desc: '',
      args: [],
    );
  }

  /// `10 digit cell phone`
  String get register_error_phone_1 {
    return Intl.message(
      '10 digit cell phone',
      name: 'register_error_phone_1',
      desc: '',
      args: [],
    );
  }

  /// `Number already registered`
  String get register_error_phone_2 {
    return Intl.message(
      'Number already registered',
      name: 'register_error_phone_2',
      desc: '',
      args: [],
    );
  }

  /// `When logging in with Google`
  String get alert_is_google_1 {
    return Intl.message(
      'When logging in with Google',
      name: 'alert_is_google_1',
      desc: '',
      args: [],
    );
  }

  /// `you will have to change your password`
  String get alert_is_google_2 {
    return Intl.message(
      'you will have to change your password',
      name: 'alert_is_google_2',
      desc: '',
      args: [],
    );
  }

  /// `from your google account`
  String get alert_is_google_3 {
    return Intl.message(
      'from your google account',
      name: 'alert_is_google_3',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get alert_button {
    return Intl.message(
      'Accept',
      name: 'alert_button',
      desc: '',
      args: [],
    );
  }

  /// `Change Passowrd`
  String get change_password_title {
    return Intl.message(
      'Change Passowrd',
      name: 'change_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Password new`
  String get change_password_placeholder_password {
    return Intl.message(
      'Password new',
      name: 'change_password_placeholder_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get change_password_placeholder_passwordvry {
    return Intl.message(
      'Confirm Password',
      name: 'change_password_placeholder_passwordvry',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get button_save {
    return Intl.message(
      'Save',
      name: 'button_save',
      desc: '',
      args: [],
    );
  }

  /// `Feactured`
  String get home_feactured {
    return Intl.message(
      'Feactured',
      name: 'home_feactured',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get home_details {
    return Intl.message(
      'Details',
      name: 'home_details',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get home_photos {
    return Intl.message(
      'Photos',
      name: 'home_photos',
      desc: '',
      args: [],
    );
  }

  /// `Ads`
  String get home_ads {
    return Intl.message(
      'Ads',
      name: 'home_ads',
      desc: '',
      args: [],
    );
  }

  /// `Password reset`
  String get reset_password_title {
    return Intl.message(
      'Password reset',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter you email`
  String get reset_password_subtitle_1 {
    return Intl.message(
      'Please enter you email',
      name: 'reset_password_subtitle_1',
      desc: '',
      args: [],
    );
  }

  /// `that is associated with your account`
  String get reset_password_subtitle_2 {
    return Intl.message(
      'that is associated with your account',
      name: 'reset_password_subtitle_2',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get button_send {
    return Intl.message(
      'Send',
      name: 'button_send',
      desc: '',
      args: [],
    );
  }

  /// `An email has been sent to`
  String get reset_dialog_text_1 {
    return Intl.message(
      'An email has been sent to',
      name: 'reset_dialog_text_1',
      desc: '',
      args: [],
    );
  }

  /// `password reset`
  String get reset_dialog_text_2 {
    return Intl.message(
      'password reset',
      name: 'reset_dialog_text_2',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get reset_dialog_button {
    return Intl.message(
      'Accept',
      name: 'reset_dialog_button',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get locate_indication_1 {
    return Intl.message(
      'Available',
      name: 'locate_indication_1',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get locate_indication_2 {
    return Intl.message(
      'Selected',
      name: 'locate_indication_2',
      desc: '',
      args: [],
    );
  }

  /// `occupied`
  String get locate_indication_3 {
    return Intl.message(
      'occupied',
      name: 'locate_indication_3',
      desc: '',
      args: [],
    );
  }

  /// `Entry`
  String get locate_entry {
    return Intl.message(
      'Entry',
      name: 'locate_entry',
      desc: '',
      args: [],
    );
  }

  /// `Summary of purchase`
  String get locate_resume_buy {
    return Intl.message(
      'Summary of purchase',
      name: 'locate_resume_buy',
      desc: '',
      args: [],
    );
  }

  /// `Total selected places:`
  String get locate_total {
    return Intl.message(
      'Total selected places:',
      name: 'locate_total',
      desc: '',
      args: [],
    );
  }

  /// `Total cost:`
  String get locate_total_cost {
    return Intl.message(
      'Total cost:',
      name: 'locate_total_cost',
      desc: '',
      args: [],
    );
  }

  /// `Selected spaces:`
  String get locate_selected_spaces {
    return Intl.message(
      'Selected spaces:',
      name: 'locate_selected_spaces',
      desc: '',
      args: [],
    );
  }

  /// `Space 3x3 \n{price} pesos (each)`
  String locate_information(Object price) {
    return Intl.message(
      'Space 3x3 \n$price pesos (each)',
      name: 'locate_information',
      desc: '',
      args: [price],
    );
  }

  /// `Buy`
  String get locate_button {
    return Intl.message(
      'Buy',
      name: 'locate_button',
      desc: '',
      args: [],
    );
  }

  /// `Create News`
  String get news_title {
    return Intl.message(
      'Create News',
      name: 'news_title',
      desc: '',
      args: [],
    );
  }

  /// `What's new?`
  String get news_body {
    return Intl.message(
      'What\'s new?',
      name: 'news_body',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get news_post {
    return Intl.message(
      'Post',
      name: 'news_post',
      desc: '',
      args: [],
    );
  }

  /// `Enter the body of the news`
  String get news_error {
    return Intl.message(
      'Enter the body of the news',
      name: 'news_error',
      desc: '',
      args: [],
    );
  }

  /// `Upload an image`
  String get news_alert_1 {
    return Intl.message(
      'Upload an image',
      name: 'news_alert_1',
      desc: '',
      args: [],
    );
  }

  /// `to continue`
  String get news_alert_2 {
    return Intl.message(
      'to continue',
      name: 'news_alert_2',
      desc: '',
      args: [],
    );
  }

  /// `Change of price`
  String get change_price_title {
    return Intl.message(
      'Change of price',
      name: 'change_price_title',
      desc: '',
      args: [],
    );
  }

  /// `Actual price`
  String get change_price_subtitle_1 {
    return Intl.message(
      'Actual price',
      name: 'change_price_subtitle_1',
      desc: '',
      args: [],
    );
  }

  /// `New price`
  String get change_price_subtitle_2 {
    return Intl.message(
      'New price',
      name: 'change_price_subtitle_2',
      desc: '',
      args: [],
    );
  }

  /// `It has been updated`
  String get change_price_alert {
    return Intl.message(
      'It has been updated',
      name: 'change_price_alert',
      desc: '',
      args: [],
    );
  }

  /// `the price with success`
  String get change_price_alert_2 {
    return Intl.message(
      'the price with success',
      name: 'change_price_alert_2',
      desc: '',
      args: [],
    );
  }

  /// `Shopping history`
  String get shopping_history_title {
    return Intl.message(
      'Shopping history',
      name: 'shopping_history_title',
      desc: '',
      args: [],
    );
  }

  /// `Spaces:`
  String get shopping_history_label_1 {
    return Intl.message(
      'Spaces:',
      name: 'shopping_history_label_1',
      desc: '',
      args: [],
    );
  }

  /// `Date:`
  String get shopping_history_label_2 {
    return Intl.message(
      'Date:',
      name: 'shopping_history_label_2',
      desc: '',
      args: [],
    );
  }

  /// `Total price:`
  String get shopping_history_label_3 {
    return Intl.message(
      'Total price:',
      name: 'shopping_history_label_3',
      desc: '',
      args: [],
    );
  }

  /// `Delete image`
  String get delete_image_title {
    return Intl.message(
      'Delete image',
      name: 'delete_image_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this image?`
  String get delete_image_body {
    return Intl.message(
      'Are you sure you want to delete this image?',
      name: 'delete_image_body',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get delete_image_cancel {
    return Intl.message(
      'Cancel',
      name: 'delete_image_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete_image_delete {
    return Intl.message(
      'Delete',
      name: 'delete_image_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete news`
  String get delete_news_title {
    return Intl.message(
      'Delete news',
      name: 'delete_news_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this news?`
  String get delete_news_body {
    return Intl.message(
      'Are you sure you want to delete this news?',
      name: 'delete_news_body',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get delete_news_cancel {
    return Intl.message(
      'Cancel',
      name: 'delete_news_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete_news_delete {
    return Intl.message(
      'Delete',
      name: 'delete_news_delete',
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
