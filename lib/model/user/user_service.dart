import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'user_local.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserLocal? _userLocal;

  signIn(UserLocal userLocal) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
        email: userLocal.email!,
        password: userLocal.password!,
      );
      User? user = userCredential.user;
      if (user != null) {
        userLocal.id = user.uid;
      }
      _userLocal = userLocal;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  signUp(UserLocal userLocal) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: userLocal.email!,
        password: userLocal.password!,
      );
      User? user = userCredential.user;
      if (user != null) {
        userLocal.id = user.uid;
      }
      _userLocal = userLocal;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
