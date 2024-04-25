import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final CollectionReference player =
      FirebaseFirestore.instance.collection('users');

  String name = '';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Retrieving screen width and height
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Container(
      child:Column(
        children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: TextField(
              style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search..'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            height: screenHeight-210,
            width: screenWidth-10,
            child: StreamBuilder(
            stream: player.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var playerSnap =
                        snapshot.data!.docs[index].data() as Map<String, dynamic>;
            
                    return !playerSnap['name']
                                .toString()
                                .toLowerCase()
                                .contains(name.toLowerCase()) &&
                            name.isNotEmpty
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255,101,75,78),
                                    width: 1,
                                ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255,230, 220, 221),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 209, 208, 208),
                                        blurRadius: 10,
                                        spreadRadius: 15),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '  ' + playerSnap['name'],
                                       style: GoogleFonts.epilogue(fontSize: 18, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      
                                      Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255,101,75,78),),
                                      SizedBox(width: 18,),
                                    ],
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
          ),
        ),],
      )
    );
  }
}