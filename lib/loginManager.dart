import 'package:firebase_auth/firebase_auth.dart';

class LoginManager {
  FirebaseAuth auth = FirebaseAuth.instance;

  void signUp(String email, String password) {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {}
  }

  void login(String email, String password) {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {}
  }
}
