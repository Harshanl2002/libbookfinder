import 'package:bookfinder/screen/dashboard.dart';
import 'package:bookfinder/screen/favriote.dart';
import 'package:bookfinder/screen/profile.dart';
import 'package:bookfinder/screen/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// import '../components/mydrawer.dart';

class Homesrc extends StatefulWidget {
  const Homesrc({super.key});

  @override
  State<Homesrc> createState() => _HomesrcState();
}

class _HomesrcState extends State<Homesrc> {
  List<Widget> wid = [
    const Dashboard(),
    const Favorite(),
    const Searchbar(),
    const Profile()
  ];
  int index = 0;
  PageController pgcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1e1e1e),
        iconTheme: const IconThemeData(color: Colors.white, size: 30.0),
        title: const Text(
          "B o o k F i n d e r",
          style: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: PageView.builder(
          itemCount: 4,
          controller: pgcontroller,
          onPageChanged: (value) {
            setState(() {
              index = value;
            });
          },
          itemBuilder: (context, position) {
            return wid[position];
          }),
      bottomNavigationBar: Container(
        color: const Color(0xff1e1e1e),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: GNav(
            gap: 10,
            backgroundColor: const Color(0xff1e1e1e),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            tabBackgroundColor: const Color(0xff3584e4),
            activeColor: Colors.white,
            color: Colors.white,
            selectedIndex: index,
            onTabChange: (value) {
              setState(() {
                index = value;
              });
              pgcontroller.jumpToPage(index);
            },
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "H o m e",
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                text: "F a v o r i t e",
              ),
              GButton(
                icon: Icons.search,
                text: "S e a r c h",
              ),
              GButton(
                icon: Icons.account_circle_outlined,
                text: "P r o f i l e",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
