import 'package:authentication_getx_firestore_flutter/screens/home_screen.dart';
import 'package:authentication_getx_firestore_flutter/screens/sign_in_screen.dart';
import 'package:authentication_getx_firestore_flutter/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static List<GetPage> pages() =>[
    GetPage(name: "/signinscreen", page: () => SignInScreen()),
    GetPage(name: "/signupscreen", page: () => SignUpScreen()),
    GetPage(name: "/homescreen", page: () => HomeScreen()),

  ];
}