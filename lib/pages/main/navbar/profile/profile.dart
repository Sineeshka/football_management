import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataScreen extends StatefulWidget {
  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;// Specify the user ID here
  
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: FutureBuilder<Map<String, dynamic>>(
          future: getUserData(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
            } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
            } else {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color.fromARGB(255, 101, 75, 78),
            ),
          ),
          //alignment: Alignment.topRight,
          height: 100,
          width: screenSize.width-20,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userDataWidget('Name', snapshot.data?['name'] ?? ''),
                userDataWidget('Email', snapshot.data?['email'] ?? ''),
                // Add more userDataWidget as needed for other fields
                
              ],
            ),
          ),
        );
            }
          },
        )
        
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getUserData(String id) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get();
    if (documentSnapshot.exists) {
      return documentSnapshot.data() ?? {};
    } else {
      return {};
    }
  } catch (e) {
    throw e;
  }
}


  Widget userDataWidget(String label, String value) {
  return Padding(
    padding: EdgeInsets.all(12.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    ),
  );
}
}

void main() {
  runApp(MaterialApp(
    home: UserDataScreen(),
  ));
}
