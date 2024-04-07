import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:sample/services/team.dart';

class Listteam extends StatefulWidget {
  
  const Listteam({super.key});

  @override
  State<Listteam> createState() => _ListteamState();
}

class _ListteamState extends State<Listteam> {
  
  //final teamService teamService = teamService();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference events = FirebaseFirestore.instance.collection('Teams');

  
  
  //final DocumentSnapshot team = snapshot.data.docs[index];
  @override
  Widget build(BuildContext context) {
    //Stream<List<teamModel>> posts = teamService.getteamsByUser(uid);
    
    Size screenSize = MediaQuery.of(context).size;

    // Retrieving screen width and height
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    
    return Container(
      child: StreamBuilder(
          stream: events.snapshots(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              print(uid);
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  final DocumentSnapshot eventsSnap = snapshot.data.docs[index];
                  if(eventsSnap["primary"]==uid)
                  {
                    //print(eventsSnap["primary"]+uid);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8,8,8,0),
                    child: Container(
                      //decoration:BoxDecoration(border: Border.all()),
                      height: screenHeight/4,
                      width: screenWidth-30,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(20),
                        //color: getBrightColor(),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            eventsSnap['name'],
                            style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              
                              eventsSnap['decsription'],style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold  ),
                              overflow: TextOverflow.clip,
                                                
                            ),
                          ),
                          // Text(
                          //   eventsSnap['datetime'].toString(),style: TextStyle(
                          //   fontSize: 12,fontWeight: FontWeight.normal  ),
                                          
                          // ),
                          Text(
                            eventsSnap['primary'],style: TextStyle(
                            fontSize: 12,fontWeight: FontWeight.normal  ),
                                          
                          ),
                          Text(
                            eventsSnap['createby'],style: TextStyle(
                            fontSize: 12,fontWeight: FontWeight.normal  ),
                                          
                          ),
                                          
                        ],
                      ),
                    ),
                  );}
                },
                );
            }
            return Container(
              child: Center(
                child: 
                Text("Loading..")
              ),
            );
          },
        ),
    );
  }
  Color getBrightColor() {
  final Random random = Random();
  
  // Generate random values for red, green, and blue components in the range of 128-255
  final int r = random.nextInt(128) + 128; // 128-255
  final int g = random.nextInt(128) + 128; // 128-255
  final int b = random.nextInt(128) + 128; // 128-255
  
  // Return a Color object with the random values
  return Color.fromARGB(255, r, g, b); // Alpha is set to 255 (opaque)
}
}




