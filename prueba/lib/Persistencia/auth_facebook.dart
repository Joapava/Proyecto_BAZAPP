import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Authfacebook {
  void signInWithFacebook() async {
  final LoginResult result = await FacebookAuth.instance.login();

  if (result.status == LoginStatus.success) {
    final AccessToken accessToken = result.accessToken!;
    print('Inicio de sesión exitoso: $accessToken');
  } else {
    print('Inicio de sesión fallido: ${result.status}');
  }
}

void signOutFromFacebook() async {
  await FacebookAuth.instance.logOut();
  print('Cierre de sesión exitoso');
}
}