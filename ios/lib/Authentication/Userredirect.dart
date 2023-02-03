import 'package:bylaive/Authentication/AuthPages.dart';
import 'package:bylaive/Authentication/SignUp.dart';
import 'package:bylaive/Splash.dart';
import 'package:bylaive/Home_Pages/HomePage.dart';
import 'package:bylaive/Authentication/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthService{

  //Determine if the user is authenticated.
  handleAuthState() {
    
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeAScreen();
          } else {
            return Authpages();
          }
        });
  }
  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,

    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);

    return AuthService().handleAuthState();
  }

  storeUserdata()async{
    DocumentReference store=await FirebaseFirestore.instance.collection('User').doc();
  }

}