import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/pages/main/navbar/add.dart';
import 'package:sample/pages/main/navbar/home.dart';
import 'package:sample/pages/main/navbar/profile/profile.dart';
import 'package:sample/pages/main/navbar/search.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<Widget> _children = [home(),Search(),Add(),Profile()];
  int _currentIndex = 0;
  void onTabPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        //title: Text("Home"),
        title: Text(
            'FOOTBALL360\'',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.black,
        // backgroundColor: Colors.black,
        onTap: onTabPressed,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home_outlined,color: Colors.black,), label: 'home',),
          BottomNavigationBarItem(icon: new Icon(Icons.search_outlined,color: Colors.black,), label: 'search'),
          BottomNavigationBarItem(icon: new Icon(Icons.add,color: Colors.black,), label: 'add'),
          BottomNavigationBarItem(icon: new Icon(Icons.person_outline,color: Colors.black,), label: 'profile')
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}