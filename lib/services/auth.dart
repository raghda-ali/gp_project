import 'package:firebase_auth/firebase_auth.dart';

class auth {
  final _auth = FirebaseAuth.instance;

  Future<String> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return "signed up successfully";
  }

  Future<String> logIn(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return "login successfully";
  }
}