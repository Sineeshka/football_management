import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        children: [TextField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search'),
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
        Container(
          height: screenHeight-200,
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
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        playerSnap['name'],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(
                                      //   playerSnap['nationality'],
                                      //   style: const TextStyle(fontSize: 18),
                                      // ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Container(
                                //     child: CircleAvatar(
                                //       backgroundColor:
                                //           const Color.fromARGB(255, 26, 118, 193),
                                //       radius: 30,
                                //       child: Text(
                                //         playerSnap['age'].toString(),
                                //         style: const TextStyle(fontSize: 25),
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
        ),],
      )
    );
  }
}