import 'package:bookfinder/components/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
            return const Signup();
          }
        },
      ),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailidcont = TextEditingController();
  final password = TextEditingController();
  final passwordcon = TextEditingController();
  final agecon = TextEditingController();
  final namecon = TextEditingController();

  void signup() async {
    String docid = "";
    if (password.text.trim() == passwordcon.text.trim()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailidcont.text.trim(), password: passwordcon.text.trim());
        docid += FirebaseAuth.instance.currentUser!.uid;
        addUserDet(
          namecon.text,
          agecon.text,
          emailidcont.text,
          docid,
        );
      } catch (e) {
        print(e);
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Password Dosen/'t Match."),
            );
          });
    }
  }

  Future addUserDet(
      String fullname, String age, String emailid, String uuid) async {
    await FirebaseFirestore.instance.collection('users').doc(uuid).set({
      'Fullname': fullname,
      'Age': int.parse(age),
      'Email_id': emailid,
    });
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
                  controler: namecon,
                  hintText: "Full Name",
                  obsecureText: false),
              const SizedBox(
                height: 10,
              ),
              Loginfield(
                  controler: agecon, hintText: "Age", obsecureText: false),
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
                    color: const Color(0xff3584e4),
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
                                color: Color(0xff3584e4),
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
