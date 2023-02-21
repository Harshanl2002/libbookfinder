import 'package:flutter/material.dart';

import '../components/mydrawer.dart';

class Homesrc extends StatelessWidget {
  const Homesrc({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
          actions: <Widget>[
            const SizedBox(width: 15.0),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
          ],
        ),
        drawer: const Mydrawer(),
      ),
    );
  }
}
