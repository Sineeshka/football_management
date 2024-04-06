import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    User? user = _auth.currentUser;
    String username = "";
    String email = "";
    
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    
  
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: screenHeight/6.4,
                  width: screenHeight/6.4,
                  decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black
                        )
                      ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black
                        )
                      ),
                      width: screenWidth-screenHeight/6.4,
                      height: screenHeight/12.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(username)),
                      ),),
                      Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black
                        )
                      ),
                      width: screenWidth-screenHeight/6.4,
                      height: screenHeight/12.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('BirthDate')),
                      ),)
                  ],
                )
              ],
            ),
            Container(
              height: screenHeight/6.4,
              width: screenWidth,
              child: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Achievement"),
                    Text("Achievement"),
                    Text("Achievement"),
                  ],
                ),
              ),
            )
          ],
        ),
        height: screenHeight/3.2,
        width: screenWidth,
      ),
    );
    }
}