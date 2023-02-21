import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 140,
                    height: 140,
                    margin: const EdgeInsets.only(
                      top: 50.0,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_circle,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(
              Icons.person,
              size: 30,
            ),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            onTap: null,
          ),
          ListTile(
            leading: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            title: const Text(
              "LogOut",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            onTap: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
