import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookfinder/screen/homescreen.dart';
import 'package:bookfinder/screen/login_page.dart';

class Authpage extends StatelessWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Homesrc();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
