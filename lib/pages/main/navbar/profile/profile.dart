import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sample/pages/main/navbar/profile/list.dart';
import 'package:sample/pages/main/navbar/profile/list1.dart';
import 'package:sample/pages/main/navbar/profile/list2.dart';
import 'package:sample/services/posts.dart';
import 'package:sample/services/tournament.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //PostService _postService = PostService();
  //TournamentService _tournamentService = TournamentService();

  //final Listteam list1 = Listteam();
  //final Listtournament list2 = Listtournament();
   
  

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
   //roshan = widget2;
    // Retrieving screen width and height
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    
    return Column(
      children: [
        UserProfile(),
        Container(
          height: 1,
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              //padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black
                )
              ),
              width: screenWidth/2,
              child: TextButton(onPressed: (){
               
              }, child: Text('Teams')),
            ),
            Container(
              //padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black
                )
              ),
              width: screenWidth/2,
              child: TextButton(onPressed: (){
              }, child: Text('Tournaments')),
            )
          ],
        ),
        Expanded(child: Listteam())
      ],
    );
  }
  
}