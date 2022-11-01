import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebase_Auth {
  FirebaseAuth Auth = FirebaseAuth.instance;

  Stream<User?> AuthStatus() {
    return Auth.authStateChanges();
  }

  void login(String email, String password) async {
    try {
      await Auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("tidak ada user yang ditemukan");
      } else if (e.code == "wrong-password") {
        print("password yang anda masukkan salah");
      }
    }
  }

  Future register({required String email, required String password}) async {
    try {
      var user = await Auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future logout() async {
    await Auth.signOut();
  }
}
