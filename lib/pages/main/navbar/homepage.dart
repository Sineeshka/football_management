import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/pages/main/navbar/add.dart';
import 'package:sample/pages/main/navbar/home.dart';
import 'package:sample/pages/main/navbar/profile/profile.dart';
import 'package:sample/pages/main/navbar/profile/list1.dart';
import 'package:sample/pages/main/navbar/search.dart';
import 'package:sample/services/auth.dart';
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
    final AuthService _authService=AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions:<Widget> [
          ElevatedButton( 
            onPressed:() async {_authService.signOut();}, 
            child: Text('Signout'),)
        ],
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
          BottomNavigationBarItem(icon: Column(
            children: [
              new Icon(Icons.home_outlined,color: Colors.black,),
              Text('Home')
            ],
          ), label: 'home',),
          BottomNavigationBarItem(icon: Column(
            children: [
              new Icon(Icons.search,color: Colors.black,),
              Text('Search')
            ],
          ), label: 'search',),
          BottomNavigationBarItem(icon: Column(
            children: [
              new Icon(Icons.add,color: Colors.black,),
              Text('Add')
            ],
          ), label: 'add',),
          BottomNavigationBarItem(icon: Column(
            children: [
              GestureDetector(
                //onTap: fetchCurrentUserInformation,
                child: new Icon(Icons.person,color: Colors.black,)),
              Text('Profile')
            ],
          ), label: 'Profile',),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}