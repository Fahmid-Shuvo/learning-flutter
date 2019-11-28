import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  bool loading = false;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );

  void startLoader() {
    loading = true;
    notifyListeners();
  }

  void stopLoader() {
    loading = false;
    notifyListeners();
  }

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

  Future<void> handleGoogleSignup() async {
    // final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    // print("TCL: UserModel -> googleUser $googleUser");

    // final GoogleSignInAuthentication googleAuth =
    //     await googleUser.authentication;

    // final AuthCredential credential = GoogleAuthProvider.getCredential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );

    // final FirebaseUser user =
    //     (await _auth.signInWithCredential(credential)).user;
    // print("signed in " + user.displayName);
    // return user;
  }
}
