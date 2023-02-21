import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/textfield.dart';
// import './auth.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailidcont = TextEditingController();
  final password = TextEditingController();

  void signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailidcont.text.trim(), password: password.text.trim());
  }

  void forgotpass() {}
  void newuser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xFF537a9a),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Container(
                  // color: Colors.grey[300],
                  decoration: BoxDecoration(
                    color: const Color(0xFFc05e6e),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  height: 150,
                  width: 150,
                  child: Center(
                    child: Image.asset(
                      'images/imgban.png',
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //Text Saying Login page
                const Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff000000),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //textfeild
                Loginfield(
                  controler: emailidcont,
                  hintText: 'Email Id',
                  obsecureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                Loginfield(
                  controler: password,
                  hintText: 'Password',
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: forgotpass,
                        child: const Text(
                          "Forgot Password?",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: signin,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50.0, 16.0, 50.0, 16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFc05e6e),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      "Sign in",
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
                    onTap: newuser,
                    child: RichText(
                      text: const TextSpan(
                          text: "New User ?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                                text: " Create Account",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFc05e6e),
                                ))
                          ]),
                    )),
                // const SizedBox(
                //   height: 25,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
