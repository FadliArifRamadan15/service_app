import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? _userCredential;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(googleUser!.email);
    // Once signed in, return the UserCredential
    await auth
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

    // firebase
    CollectionReference users = firestore.collection('users');

    final cekuser = await users.doc(googleUser.email).get();
    if (!cekuser.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'nohp': "-",
        'creadAt': _userCredential!.user!.metadata.creationTime.toString(),
        'lastloginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      });
    } else {
      users.doc(googleUser.email).update({
        'lastloginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      });
    }
    Get.offAllNamed(Routes.HOME);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
