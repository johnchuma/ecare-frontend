// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future firebaseAuth() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  void registerUserToFirebase(User user) async {
    try {
      firestore
          .collection("users")
          .doc(user.email)
          .set({"email": user.email, "status": "Online"});
    } catch (e) {
      print(e);
    }
  }

  void updateUserStatus(User user, String status) async {
    try {
      firestore.collection("users").doc(user.email).update({"status": status});
    } catch (e) {
      print(e);
    }
  }
}
