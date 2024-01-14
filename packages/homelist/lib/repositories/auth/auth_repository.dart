import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final Stream<User?> userStream = FirebaseAuth.instance.authStateChanges();

  Future<UserCredential?> logIn({
    required String email,
    required String password,
  }) async {
    UserCredential? credential;
    try {
      credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      } else {
        log(e.message.toString());
      }
    }

    return credential;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
