import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyecto_pe/pages/homepage.dart';
import 'package:proyecto_pe/pages/login.dart';
import 'package:proyecto_pe/pages/register.dart';

class AuthService {

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]
    ).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  githubSignIn() async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();

    return await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
  }

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const Register();
        }
        else {
          return const Login();
        }
      },
    );
  }

  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }
}