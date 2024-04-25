import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTournament extends StatefulWidget {
  const PageTournament({super.key});

  @override
  State<PageTournament> createState() => _PageTournamentState();
}

class _PageTournamentState extends State<PageTournament> {
  @override
  Widget build(BuildContext context) {
    //CollectionReference events = FirebaseFirestore.instance.collection('events');
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        //leading: Icon(Icons.sports_soccer_sharp,color: Colors.white,),
        title: Text(
                                      'Tournament Deatils',
                                      style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white),
                                    ),
        backgroundColor: Color.fromARGB(255,101,75,78),
      ),
      backgroundColor: Color.fromARGB(255,230, 220, 221),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('events').doc('pI7TX9VMmmZZEAVSdMgM').get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          // if (snapshot.hasError) {
          //   return Center(child: CircularProgressIndicator()); // Show loading indicator while data is being fetched
          // }

          if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          Container(
                            child: Image.network(
                                   'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630', // Replace 'your_image_url_here' with the URL of your image from Firebase Storage
                                   fit: BoxFit.cover, // Use BoxFit.cover to cover the entire curved area
                                 ),
                          ),
                          Container(
                                  height: 35,
                                  margin: EdgeInsets.all(0), // Add some margin for spacing
                                  //padding: EdgeInsets.all(16),
                                  color: Color.fromARGB(255,216,223,233),
                                  child: Center(
                                    child: Text(
                                      'Tournament Name: ${data?['name'] ?? 'N/A'}',
                                      style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      // child: Stack(
                      //   alignment: Alignment.bottomLeft, // Aligns items to the bottom left corner
                      //         children: [
                      //           // Background container with image
                      //           ClipRRect(
                      //         borderRadius: BorderRadius.circular(10), // Match the borderRadius of the container
                      //         child: Image.network(
                      //           'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630', // Replace 'your_image_url_here' with the URL of your image from Firebase Storage
                      //           fit: BoxFit.cover, // Use BoxFit.cover to cover the entire curved area
                      //         ),
                      //       ),
                      //           // Overlay container with text
                      //           Container(
                              
                      //             margin: EdgeInsets.all(0), // Add some margin for spacing
                      //             //padding: EdgeInsets.all(16),
                      //             color: Colors.deepOrange,
                      //             child: Center(
                      //               child: Text(
                      //                 'Tournament Name: ${data?['name'] ?? 'N/A'}',
                      //                 style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      // ),
                    ),
                  ),
                  
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                                          children: [
                                            Text(
                                                                  'Host: ',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                            Text(
                                                                  '${data?['host'].toString() ?? 'N/A'}',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Colors.blue,),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                                  'Description: ',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                            
                                          ],
                                        ),
                                        Container(
                                          height: 1,
                                          color: Color.fromARGB(255,101,75,78),
                                          width: 100,
                                        ),
                                        Text(
                                                                  '${data?['description'].toString() ?? 'N/A'}',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                        Row(
                                          children: [
                                            Text(
                                                                  'Registration Fee: ',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                            Text(
                                                                  '${data?['fee'].toString() ?? 'N/A'}',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                                  'Tournament Mode: ',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                            Text(
                                                                  '${data?['mode'].toString() ?? 'N/A'}',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                                  'No of Teams: ',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                            Text(
                                                                  '${data?['number'].toString() ?? 'N/A'}',
                                                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                                            ),
                                          ],
                                        ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      color: Color.fromARGB(255,101,75,78),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Date: ',
                          style: GoogleFonts.epilogue(fontSize: 20, fontWeight: FontWeight.bold,color:Color.fromARGB(255,216,223,233),),
                        ),
                        Text(
                          '${data?['datetime'] ?? 'N/A'}',
                          style: GoogleFonts.epilogue(fontSize: 20, fontWeight: FontWeight.normal,color:Color.fromARGB(255,216,223,233),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height/15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        'REGISTER YOUR TEAM',
                        style: GoogleFonts.epilogue(fontSize: 20, fontWeight: FontWeight.normal,color:Color.fromARGB(255,216,223,233),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        }
        return Center(child: CircularProgressIndicator());
        }
      ),  
    );
  }
}