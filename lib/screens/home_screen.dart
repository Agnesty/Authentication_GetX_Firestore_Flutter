import 'package:authentication_getx_firestore_flutter/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String? email;
  HomeScreen({Key? key, this.email}) : super(key: key);
  static String routeName = "/homescreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome To \nHome Screen",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            email!,
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 80,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: InkWell(
              onTap: () {
                authController.signOut();
              },
              child: const Center(
                child: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
