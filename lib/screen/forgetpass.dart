import 'package:bookfinder/components/textfield.dart';
import 'package:flutter/material.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  var email_Cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Enter the Email we will send you the reset Link"),
            const SizedBox(
              height: 25.0,
            ),
            Loginfield(
              controler: email_Cont,
              hintText: 'Email Id',
              obsecureText: false,
            ),
            const SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                padding: const EdgeInsets.fromLTRB(50.0, 16.0, 50.0, 16.0),
                decoration: BoxDecoration(
                  color: const Color(0xff3584e4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Text(
                  "Send Link",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
