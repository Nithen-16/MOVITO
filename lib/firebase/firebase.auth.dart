import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password, String username, String mobileno) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Storing additional user data in Firestore
      await _firestore.collection('users').doc(credential.user?.uid).set({
        'email': email,
        'password' : password,
        'username' : username,
        'mobileno' : mobileno,
        'createdAt': FieldValue.serverTimestamp(), // Storing timestamp
        // You can store more fields if needed, like displayName, etc.
      });

      return credential.user;
    } catch (e) {
      print("Error occurred during sign-up: $e");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      print("Error occurred during sign-in: $e");
    }
    return null;
  }
}