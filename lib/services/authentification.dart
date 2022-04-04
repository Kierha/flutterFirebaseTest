// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:trinityauth/common/models/user.dart';

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
      // return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return "erreur de connexion";
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      print(email);
      print(password);
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // ignore: todo
      // TODO Store new user in Firestore

      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}
