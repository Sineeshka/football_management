// ignore_for_file: unused_import, sort_child_properties_last, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class playerProfile extends StatelessWidget {
  List<Map> searchResults = [];
  int index;

  playerProfile({required this.searchResults, required this.index});

  final CollectionReference player =
      FirebaseFirestore.instance.collection('player');

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: screenSize.width,
              height: screenSize.height - 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: (screenSize.height - 400) / 2 - 25,
                            ),
                          ),
                          width: (screenSize.height - 400) / 2 - 15,
                          height: (screenSize.height - 400) / 2 - 15,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "NAME:",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      searchResults[index]['name']
                                          .toUpperCase(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "E-MAIL:",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      searchResults[index]['email'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "BIRTHDATE:",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      searchResults[index]['birthdate']
                                          .toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black)),
                      width: screenSize.width - 10,
                      height: (screenSize.height - 400) / 2 - 20,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Achievements",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(Icons.grade_outlined),
                                const SizedBox(width: 4),
                                Text(
                                  "Emirate Cup Winner",
                                  style: GoogleFonts.robotoMono(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.grade_outlined),
                                const SizedBox(width: 4),
                                Text("Champions League Runner Up",
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.grade_outlined),
                                const SizedBox(width: 4),
                                Text("Indian Super League Winner",
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal))
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.yellow,
                height: 40,
                width: screenSize.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text("Activities",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.normal)),
                )),
            Container(
              width: screenSize.width,
              height: 359,
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                       child: ListTile(
                      //    title: Text("hello $index"),
                       ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}