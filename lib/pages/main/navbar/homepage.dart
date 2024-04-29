import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/pages/main/navbar/add.dart';
import 'package:sample/pages/main/navbar/home.dart';
import 'package:sample/pages/main/navbar/notifiacation.dart';
import 'package:sample/pages/main/navbar/profile/profile.dart';
import 'package:sample/pages/main/navbar/profile/list1.dart';
import 'package:sample/pages/main/navbar/search.dart';
import 'package:sample/pages/pageForTeam.dart';
import 'package:sample/pages/pageForTournament.dart';
import 'package:sample/services/auth.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<Widget> _children = [home(),Search(),Add(),UserDataScreen()];
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
      backgroundColor: Color.fromARGB(255,230, 220, 221),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,101,75,78),
        actions:<Widget> [
          GestureDetector(
            onTap: () async {_authService.signOut();},
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,10,0),
            child: Container(
              child: Center(
                child: Text('Sign Out',style: GoogleFonts.epilogue(
                  fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:  Colors.black
              ),
              height: 35,
              width: 80,
              //color: Color.fromARGB(255,230, 220, 221),
            ),
          )),
        ],
        title: Text(
            'FOOTBALL360\'',
             style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.normal,color:Colors.white,),
            ),
          ),

      
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.black,
        backgroundColor: Colors.black,
        onTap: onTabPressed,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Column(
            children: [
              new Icon(Icons.home,size: 30,color: Color.fromARGB(255,101,75,78)),
              Text('Home', style: GoogleFonts.epilogue(fontSize: 13, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),)
            ],
          ), label: 'home',),
          BottomNavigationBarItem(icon: Column(
            children: [
              new Icon(Icons.search,size: 30,color: Color.fromARGB(255,101,75,78)),
              Text('Search', style: GoogleFonts.epilogue(fontSize: 13, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),)
            ],
          ), label: 'search',),
          BottomNavigationBarItem(icon: Column(
            children: [
              new Icon(Icons.add,size: 30,color: Color.fromARGB(255,101,75,78)),
              Text('Add', style: GoogleFonts.epilogue(fontSize: 13, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),)
            ],
          ), label: 'add',),
          BottomNavigationBarItem(icon: Column(
            children: [
              GestureDetector(
                //onTap: fetchCurrentUserInformation,
                child: new Icon(Icons.person,size: 30,color: Color.fromARGB(255,101,75,78))),
              Text('Profile', style: GoogleFonts.epilogue(fontSize: 13, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),)
            ],
          ), label: 'Profile',),
        ],
      ),
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(onPressed: () {
            //Navigate to TournamentDetailScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Noti()),
            );
          },
          child: Icon(Icons.notifications,color: Color.fromARGB(255,230, 220, 221),),
          backgroundColor: Color.fromARGB(255,101,75,78),),
    );
  }
}