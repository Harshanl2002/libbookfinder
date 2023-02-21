import 'package:flutter/material.dart';

class Loginfield extends StatelessWidget {
  final String? hintText;
  final controler;
  final bool obsecureText;
  const Loginfield(
      {super.key,
      required this.controler,
      required this.hintText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controler,
          obscureText: obsecureText,
          decoration: InputDecoration(hintText: hintText),
        ));
  }
}
