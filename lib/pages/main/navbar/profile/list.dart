import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sample/models/tournament.dart';
import 'package:sample/services/tournament.dart';

class Listtournament extends StatefulWidget {
  
  const Listtournament({super.key});

  @override
  State<Listtournament> createState() => _ListtournamentState();
}

class _ListtournamentState extends State<Listtournament> {
  
  final TournamentService tournamentService = TournamentService();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference events = FirebaseFirestore.instance.collection('events');

  
  
  //final DocumentSnapshot tournament = snapshot.data.docs[index];
  @override
  Widget build(BuildContext context) {
    Stream<List<TournamentModel>> posts = tournamentService.getTournamentsByUser(uid);
    
    Size screenSize = MediaQuery.of(context).size;

    // Retrieving screen width and height
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    
    return Container(
      child: StreamBuilder(
          stream: events.snapshots(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  final DocumentSnapshot eventsSnap = snapshot.data.docs[index];
                  if(eventsSnap["primary"]==uid)
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8,8,8,0),
                    child: Container(
                      //decoration:BoxDecoration(border: Border.all()),
                      height: screenHeight/4,
                      width: screenWidth-30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                        
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
                              
                              eventsSnap['description'],style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold  ),
                              overflow: TextOverflow.clip,
                                                
                            ),
                          ),
                          Text(
                            eventsSnap['location'],style: TextStyle(
                            fontSize: 12,fontWeight: FontWeight.normal  ),
                                          
                          ),
                          Text(
                            eventsSnap['datetime'].toString(),style: TextStyle(
                            fontSize: 12,fontWeight: FontWeight.normal  ),
                                          
                          ),
                          
                                          
                        ],
                      ),
                    ),
                  );
                },
                );
            }
            return Container();
          },
        ),
    );
  }
}




