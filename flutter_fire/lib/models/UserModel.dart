import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> handleSignUp(
      String name, String email, String password) async {
    try {
      final FirebaseUser registeredUser = (await _auth
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;

      await _db.collection('users').add({'email': email, 'name': name});
      return registeredUser;
    } catch (error) {
      throw new AuthException(error.code, error.message);
    }
  }

  Future<FirebaseUser> handleGoogleSignUp() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;

      return user;
    } catch (error) {
      throw new AuthException(error.code, error.message);
    }
  }
}
