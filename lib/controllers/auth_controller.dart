import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco/views/homepage.dart';
import 'package:onco/views/overview.dart';

import '../constants.dart';
import '../models/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.to(() => CreateAccountScreen());
    } else {
      Get.to(() => CancerRiskAssessmentOverview());
    }
  }

  // registering the user
  void registerUser(
      String username, String email, String password, String phoneNumber) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
            name: username,
            email: email,
            uid: cred.user!.uid,
            number: phoneNumber,
            responses: []
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        // navigatorKey.currentContext?.pop();
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      // navigatorKey.currentContext?.pop();
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  void loginUser(String username, String password) async {
    try {
      var response = await firestore.collection("users").where("name", isEqualTo: username).get();
      if (response.docs.isNotEmpty) {
        model.User query = model.User.fromSnap(response.docs.first);
        await firebaseAuth.signInWithEmailAndPassword(
            email: query.email, password: password);
      } else {
        // navigatorKey.currentContext?.pop();
        Get.snackbar(
          'Error Logging in',
          'No such User Exists.',
        );
      }
    } catch (e) {
      // navigatorKey.currentContext?.pop();
      Get.snackbar(
        'Error Logging in',
        e.toString(),
      );
    }
  }

  void updateResponse(String response, int index) async {
    var res = firestore.collection("users").doc(user.uid);
    await res.update({
      "responses": FieldValue.arrayUnion([{"question": index, "response": response}])
    });
    update();
  }


  void signOut() async {
    await firebaseAuth.signOut();
  }
}