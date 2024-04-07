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
  CollectionReference users = FirebaseFirestore.instance.collection('users');
    final String uid = FirebaseAuth.instance.currentUser!.uid;


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    User? user = _auth.currentUser;
    String username ='';
    String email;
    //_fetch();
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    
  
    return FutureBuilder<DocumentSnapshot>(
          future: users.doc(uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Container(
        height: screenHeight/3.2,
        width: screenWidth,
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
                        child: Center(child: Text(data["name"])),
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
                        child: Center(child: Text(data["birthdate"].toString())),
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
                    Text(data["achievement1"]),
                    Text(data["achievement2"]),
                    Text(data["achievement3"]),
                  ],
                ),
              ),
            )
          ],
        ),
      );
        }   
        return Text("loading");

          },
        );
      
    }
  //    _fetch() async {
  //   final firebaseUser = await FirebaseAuth.instance.currentUser!;
  //   if (firebaseUser != null){
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .document(firebaseUser.uid)
  //         .get()
  //         .then((ds) {
  //           var username = ds.data['name'];
  //           var myEmail = ds.data['email'];
  //       print(myEmail);
  //     }).catchError((e) {
  //       print(e);
  //     });
  //   }
  // }
}