import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTeam extends StatefulWidget {
  const PageTeam({super.key});

  @override
  State<PageTeam> createState() => _PageTeamState();
}

class _PageTeamState extends State<PageTeam> {
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
                                      'Team Deatils',
                                      style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white),
                                    ),
        backgroundColor: Color.fromARGB(255,101,75,78),
      ),
      backgroundColor: Color.fromARGB(255,230, 220, 221),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('Teams').doc('lvZHRabvZOyeo2ulkH9S').get(),
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
                                  color: Colors.black,
                                  child: Center(
                                    child: Text(
                                      'Team Name: ${data['name'] ?? 'N/A'}',
                                      style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white,),
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
                      //                 'Team Name: ${data?['name'] ?? 'N/A'}',
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
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                      'Created By : ${data['createby'] ?? 'N/A'}',
                      style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Colors.deepPurple),
                                        ),
                                        Text(
                      'Description: ${data['decsription'] ?? 'N/A'}',
                      style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                                        ),
                                        Text(
                      'Location : ${data['location'] ?? 'N/A'}',
                      style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                                        ),
                                        //Text(
                      // 'Registration Fee: ${data?['fee'].toString() ?? 'N/A'}',
                      // style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                      //                   ),
                      //                   Text(
                      // 'Team Mode: ${data?['mode'] ?? 'N/A'}',
                      // style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                      //                   ),
                      //                   Text(
                      // 'No of Teams: ${data?['number'].toString() ?? 'N/A'}',
                      // style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                      //                   ),
                      
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color:Color.fromARGB(000,230, 220, 221),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
                              child: Text(
                                  'Team Members',
                                  style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.black),
                                ),
                            ),
                              Container(
                                height: screenSize.height/3,
                                child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('Teams')
                                            .doc('lvZHRabvZOyeo2ulkH9S')
                                            .collection('Members')
                                            .snapshots(),
                                        builder: (context, orderSnapshot) {
                                          return orderSnapshot.hasData
                                              ? Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  child: Container(
                                                    width: screenSize.width,
                                                    //height: ,
                                                    child: ListView.builder(
                                                        itemCount: orderSnapshot.data!.docs.length,
                                                        itemBuilder: (context, index) {
                                                          DocumentSnapshot data =
                                                              orderSnapshot.data!.docs[index];
                                                          return Padding(
                                                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                                            child: Container(
                                                              height: 100,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: Colors.black87
                                                                ),
                                                                borderRadius: BorderRadius.circular(10),
                                                              ),
                                                              child: Center(
                                                                child: ListTile(
                                                                  leading: Container(
                                                                    //height: 90,
                                                          decoration: BoxDecoration(
                                                            //color: Color.fromARGB(255,255, 220, 221),
                                                            shape: BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color.fromARGB(255,101,75,78), // Border color
                                                              width: 2.0, // Border width
                                                            ),
                                                          ),
                                                          child: Icon(Icons.person,size: 40,color: Color.fromARGB(255,101,75,78),)
                                                        
                                                        ),
                                                              title: Text(' ${data['Name'] ?? 'N/A'}',style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.bold,color:Color.fromARGB(255,101,75,78),),
                                                              ),
                                                              subtitle:  Text(' ${data['Age'] ?? 'N/A'},'+'${data['Position'] ?? 'N/A'}',
                                                              style: GoogleFonts.epilogue(fontSize: 16, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),
                                                                                            
                                                                
                                                                ),
                                                                trailing: Column(
                                                                children: [
                                                                  Text('View Profile',style: GoogleFonts.epilogue(fontSize: 13, fontWeight: FontWeight.normal,color:Color.fromARGB(255,101,75,78),),),
                                                                  Container(
                                                                    height: 1,
                                                                    color: Color.fromARGB(255,101,75,78),
                                                                    width: 75,
                                                                  ),
                                                                ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),);
                                                        },
                                                      ),
                                                  ),
                                                ),
                                              )
                                              : Text('loading...');
                                        }),
                              ),
                          ],
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