import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> signIn({required String email, required String pwd}) async {
    var ex = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pwd);
    return ex.user?.uid;
  }

  Future<List> loadImages() async {
    ListResult result = await FirebaseStorage.instance.ref('uploads').listAll();
    List<String> urls = [];
    for (var ref in result.items) {
      String url = await ref.getDownloadURL();
      urls.add(url);
    }
    return urls;
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
