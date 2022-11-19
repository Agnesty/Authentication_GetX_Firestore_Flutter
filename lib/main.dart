import 'package:authentication_getx_firestore_flutter/constants.dart';
import 'package:authentication_getx_firestore_flutter/controllers/auth_controller.dart';
import 'package:authentication_getx_firestore_flutter/routes/routes.dart';
import 'package:authentication_getx_firestore_flutter/screens/home_screen.dart';
import 'package:authentication_getx_firestore_flutter/screens/sign_in_screen.dart';
import 'package:authentication_getx_firestore_flutter/screens/sign_up_screen.dart';
import 'package:authentication_getx_firestore_flutter/screens/widgets/text_input_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
    });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login Screen',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}

