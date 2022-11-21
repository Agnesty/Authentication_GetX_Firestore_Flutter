import 'dart:io';
import 'package:authentication_getx_firestore_flutter/constants.dart';
import 'package:authentication_getx_firestore_flutter/screens/home_screen.dart';
import 'package:authentication_getx_firestore_flutter/screens/sign_in_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentication_getx_firestore_flutter/models/users_model.dart'
    as model;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
     _user.bindStream(firebaseAuth.userChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => SignInScreen());
    } else {
      Get.offAll(() => HomeScreen(email: user.email!));
    }
  }

  // registering the user
  void registerUser(
      String username, String email, String password) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        // save out user to our auth and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        model.User user = model.User(
          username: username,
          email: email,
          uid: cred.user!.uid,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
    
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          'Error logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Logging in',
        e.toString(),
      );
    }
    
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}