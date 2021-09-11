import 'package:firebase_auth/firebase_auth.dart';

class LoginManager {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> signUp(String email, String password) async {
    try {
      UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return (cred.user!.uid);
    } on FirebaseAuthException catch (e) {
      return (e.toString());
    }
  }

  Future<String> login(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return (credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return (e.toString());
    }
  }
}
