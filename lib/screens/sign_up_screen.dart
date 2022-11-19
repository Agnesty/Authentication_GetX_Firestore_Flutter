import 'package:authentication_getx_firestore_flutter/controllers/auth_controller.dart';
import 'package:authentication_getx_firestore_flutter/screens/sign_in_screen.dart';
import 'package:authentication_getx_firestore_flutter/screens/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:authentication_getx_firestore_flutter/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signupscreen";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _usernameController = TextEditingController();
    var _passwordController = TextEditingController();
    var _emailController = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 250,
                height: 220,
                child: LottieBuilder.network(
                    "https://assets7.lottiefiles.com/packages/lf20_zw0djhar.json"),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _usernameController,
                    icon: Icons.person,
                    labelText: 'Username',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.name),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _emailController,
                    icon: Icons.email,
                    labelText: 'Email',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _passwordController,
                    icon: Icons.lock,
                    labelText: 'Password',
                    isObsecure: true,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: InkWell(
                  onTap: () {
                    authController.registerUser(
                        _usernameController.text.trim(),
                        _emailController.text.trim(),
                        _passwordController.text.trim());
                  },
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: TextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ));
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
