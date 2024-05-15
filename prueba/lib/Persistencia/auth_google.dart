import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authgoole {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> loginGoogle() async {
    final googleAccount = await googleSignIn.signIn();

    final googleAuth = await googleAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<void> singout() async {
    await googleSignIn.signOut();
  }
}
