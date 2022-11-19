import 'package:flutter/material.dart';

import '../../constants.dart';

class TextInputField extends StatelessWidget {
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String labelText;
  final bool isObsecure;
  final IconData icon;
  const TextInputField({
    Key? key,
    required this.textInputType,
    required this.textInputAction,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.isObsecure = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      textInputAction: textInputAction,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: borderColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: borderColor,
            )),
      ),
      obscureText: isObsecure,
    );
  }
}