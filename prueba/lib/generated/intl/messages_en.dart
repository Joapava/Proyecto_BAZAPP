// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "forget": MessageLookupByLibrary.simpleMessage("Forget your password?"),
        "message_error_login":
            MessageLookupByLibrary.simpleMessage("Incorrect email or password"),
        "not_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "placeholder_box_email":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "placeholder_box_pwd":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "register": MessageLookupByLibrary.simpleMessage("Signup"),
        "subtitle_1": MessageLookupByLibrary.simpleMessage(
            "Welcome back! Please enter your data"),
        "subtitle_account_password":
            MessageLookupByLibrary.simpleMessage("Password"),
        "subtitle_account_profile":
            MessageLookupByLibrary.simpleMessage("Profile"),
        "subtitle_app_lang": MessageLookupByLibrary.simpleMessage("Language"),
        "subtitle_app_noti":
            MessageLookupByLibrary.simpleMessage("Notifications"),
        "subtitle_box_account": MessageLookupByLibrary.simpleMessage("Account"),
        "subtitle_box_app": MessageLookupByLibrary.simpleMessage("App"),
        "subtitle_box_policy": MessageLookupByLibrary.simpleMessage(
            "Policy, Terms and Conditions"),
        "subtitle_enter": MessageLookupByLibrary.simpleMessage("or"),
        "subtitle_policy_privacy":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "subtitle_policy_term":
            MessageLookupByLibrary.simpleMessage("Terms and Conditions"),
        "title_box_email": MessageLookupByLibrary.simpleMessage("Email"),
        "title_box_enter": MessageLookupByLibrary.simpleMessage("login"),
        "title_box_pwd": MessageLookupByLibrary.simpleMessage("Password"),
        "title_is":
            MessageLookupByLibrary.simpleMessage("Login to your account"),
        "title_signout": MessageLookupByLibrary.simpleMessage("Sign out"),
        "tittle_settings": MessageLookupByLibrary.simpleMessage("Settings")
      };
}
