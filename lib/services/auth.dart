import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< Updated upstream

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
=======
import 'package:gp_project/models/user.dart';

class auth {
  //auth(){}
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 Stream<String> get onAuthStateChanged => _firebaseAuth.authStateChanges().map(
        (User user)  => user?.uid,
  );

  String getCurrentUID() {
    return _firebaseAuth.currentUser.uid;
  }
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
>>>>>>> Stashed changes
  }
}