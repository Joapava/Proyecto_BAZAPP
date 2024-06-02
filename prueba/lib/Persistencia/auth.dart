import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();


  Future<String?> signIn({required String email, required String pwd}) async {
    var ex = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pwd);
    if(ex.user != null){
      if(ex.user!.emailVerified) return ex.user!.uid;
    }
    return null;
  }

  Future<String> createUser(
      {required String email, required String pwd}) async {
    var r = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pwd);
    UserCredential userCredential = r;
    User? usuario = userCredential.user;
    if(usuario != null && !usuario.emailVerified){
      await usuario.sendEmailVerification();
    }
    return r.user!.uid.toString();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> cambiarpwd(String pwd) async {
    if (currentUser != null) {
      await currentUser?.updatePassword(pwd);
    }
  }

  Future<void> reiniciocontra(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  
}
  