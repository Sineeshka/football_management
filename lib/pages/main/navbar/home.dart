import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('events').snapshots();
  TextStyle mine = GoogleFonts.epilogue(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
        return Container( 
          color: Color.fromARGB(255,230, 220, 221),
          child: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.fromLTRB(6.0,4,6,4),
              child: Column(
                children: [
                  Align(
      alignment: Alignment.topLeft, // Align this child to the top left corner
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          color: Colors.transparent,
          child: Text(data['datetime'].toString(),style: GoogleFonts.epilogue(
                fontSize: 13, fontWeight: FontWeight.normal, color:Colors.black),),
        ),
      ),
    ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255,101,75,78),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: screenSize.height/4,
                    width: screenSize.width-20,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                        alignment: Alignment.topLeft, // Align this child to the top left corner
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data['location'].toString(),style: GoogleFonts.epilogue(
                        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),),
                        ),
                      ),
                      //     Text(data['datetime'].toString(),style: GoogleFonts.epilogue(
                      // fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          Text(data['name'].toUpperCase(),style: GoogleFonts.epilogue(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                      Container(
                        height: 1,
                        width: getTextWidth(data['name'], mine )*1.5,
                        
                        color: Color.fromARGB(255,101,75,78),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/teamprofile',arguments: {
                            'name' : data['name'],
                            'host' : data['host'],
                            'description' : data['description'],
                            'datetime' : data['datetime'],
                            'location' : data['location']


                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255,101,75,78),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 40,
                          width: screenSize.width/1.7,
                          child: Center(
                            child: Text('Register Now',style: GoogleFonts.epilogue(
                                            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                          ),
                        ),
                      ),
                          
                          Text(data['location'],style: GoogleFonts.epilogue(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          Text('Host: ${data['host']}',style: GoogleFonts.epilogue(
                      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),),
                      SizedBox(
                        height: 5,
                      )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    color: Color.fromARGB(255,101,75,78),
                    height: 1,
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    ),
    );
  }
  double getTextWidth(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
  )..layout();

  return textPainter.width;
}
}