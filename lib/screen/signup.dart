// ignore_for_file: avoid_print

import 'package:bookfinder/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';

class Signupauthpage extends StatelessWidget {
  const Signupauthpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Homesrc();
          } else {
            return Signup();
          }
        },
      ),
    );
  }
}

class Signup extends StatelessWidget {
  Signup({super.key});
  final emailidcont = TextEditingController();
  final password = TextEditingController();
  final passwordcon = TextEditingController();
  final age_con = TextEditingController();
  final name_con = TextEditingController();

  void signup() async {
    if (password.text.trim() == passwordcon.text.trim()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailidcont.text.trim(), password: passwordcon.text.trim());
      } catch (e) {
        print(e);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 250,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 25,
              ),
              Loginfield(
                  controler: name_con,
                  hintText: "Full Name",
                  obsecureText: false),
              const SizedBox(
                height: 10,
              ),
              Loginfield(
                  controler: age_con, hintText: "Age", obsecureText: false),
              const SizedBox(
                height: 10,
              ),
              Loginfield(
                  controler: emailidcont,
                  hintText: "Email Id",
                  obsecureText: false),
              const SizedBox(
                height: 10,
              ),
              Loginfield(
                  controler: password,
                  hintText: "Password",
                  obsecureText: true),
              const SizedBox(
                height: 10,
              ),
              Loginfield(
                  controler: passwordcon,
                  hintText: "Password confomation",
                  obsecureText: true),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: signup,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50.0, 16.0, 50.0, 16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFc05e6e),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: RichText(
                    text: const TextSpan(
                        text: "Already A User ?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                              text: " Log in",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFc05e6e),
                              ))
                        ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
