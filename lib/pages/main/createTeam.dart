import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';



class AddTeamPage extends StatefulWidget {
  @override
  _AddTeamPageState createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State
 {
  String _selectedUserName = ''; // Variable to store the selected user name
  String _teamId = ''; // Variable to store the ID of the newly added team
  TextEditingController _teamNameController = TextEditingController();
  TextEditingController _teamDescriptionController = TextEditingController();
  TextEditingController _teamLocationController = TextEditingController();
  TextStyle mine = GoogleFonts.epilogue(
                fontSize: 16, fontWeight: FontWeight.normal, color: Color.fromARGB(255,101,75,78),);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,101,75,78),
        centerTitle: true,
        title: Text('Create Team',style: GoogleFonts.epilogue(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255,230, 220, 221),),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: screenSize.width-80,
              decoration: BoxDecoration(
                        color: Color.fromARGB(255,230, 220, 221),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _teamNameController,
                  decoration: InputDecoration(labelText: 'Team Name',labelStyle: mine),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: screenSize.width-80,
              decoration: BoxDecoration(
                        color: Color.fromARGB(255,230, 220, 221),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _teamDescriptionController,
                  decoration: InputDecoration(labelText: 'Team Description',labelStyle: mine),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: screenSize.width-80,
              decoration: BoxDecoration(
                        color: Color.fromARGB(255,230, 220, 221),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _teamLocationController,
                  decoration: InputDecoration(labelText: 'Team Location',labelStyle: mine),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
                      child: Container(
                      height: 50,
                      width: screenSize.width-80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
                      child: Center(
                        child: Text(
                          'Add Team',
                        style:GoogleFonts.epilogue(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255,230, 220, 221),),),
                      ),
                    ),
                      onTap: () {
                _addTeamData();
              },
                    ),
            SizedBox(height: 10),
            // Text(
            //   'Selected User: $_selectedUserName',
            //   style: TextStyle(fontSize: 18),
            // ),
            GestureDetector(
                      child: Container(
                      height: 50,
                      width: screenSize.width-80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255,101,75,78),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
                      child: Center(
                        child: Text('Select GoalKeeper',style:GoogleFonts.epilogue(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255,230, 220, 221),),),
                      ),
                    ),
                      onTap: () {
                _selectUser1();
              },
                    ),
                    SizedBox(height: 10),
                     GestureDetector(
                      child: Container(
                      height: 50,
                      width: screenSize.width-80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255,101,75,78),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
                      child: Center(
                        child: Text('Select Forwards',style:GoogleFonts.epilogue(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255,230, 220, 221),),),
                      ),
                    ),
                      onTap: () {
                _selectUser2();
              },
                    ),
                    SizedBox(height: 10),
                     GestureDetector(
                      child: Container(
                      height: 50,
                      width: screenSize.width-80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255,101,75,78),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
                      child: Center(
                        child: Text('Select Defenders',style:GoogleFonts.epilogue(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255,230, 220, 221),),),
                      ),
                    ),
                      onTap: () {
                _selectUser3();
              },
                    ),
          ],
        ),
      ),
    );
  }

  // Function to add team data to Firestore
  void _addTeamData() async {
    try {
      // Reference to the Firestore instance
      final firestoreInstance = FirebaseFirestore.instance;

      // Data to be added to the "Teams" collection
      Map<String, dynamic> teamData = {
        'name': _teamNameController.text,
        'description': _teamDescriptionController.text,
        'location': _teamLocationController.text,
      };

      // Add data to the "Teams" collection
      DocumentReference teamRef =
          await firestoreInstance.collection('Teams').add(teamData);

      // Get the ID of the newly added team
      _teamId = teamRef.id;

      print('Team added successfully with ID: $_teamId');
    } catch (e) {
      print('Error adding team data: $e');
    }
  }

  // Function to select a user
  void _selectUser1() async {
    try {
      if (_teamId.isEmpty) {
        print('Please add a team first.');
        return;
      }

      // Retrieve user data
      QuerySnapshot usersSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .get();

      // Show a dialog with the list of users to select from
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           // title: Text('Select User'),
            content: SingleChildScrollView(
              child: ListBody(
                children: usersSnapshot.docs.map((userDoc) {
                  String userName = userDoc['name'];
                  return ListTile(
                    title: Text(userName),
                    onTap: () {
                      _addUserToGoalKepper(_teamId, userName);
                      Navigator.pop(context); // Close the dialog
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print('Error selecting user: $e');
    }
  }
  void _selectUser2() async {
    try {
      if (_teamId.isEmpty) {
        print('Please add a team first.');
        return;
      }

      // Retrieve user data
      QuerySnapshot usersSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .get();

      // Show a dialog with the list of users to select from
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           // title: Text('Select User'),
            content: SingleChildScrollView(
              child: ListBody(
                children: usersSnapshot.docs.map((userDoc) {
                  String userName = userDoc['name'];
                  return ListTile(
                    title: Text(userName),
                    onTap: () {
                      _addUserToForward(_teamId, userName);
                      Navigator.pop(context); // Close the dialog
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print('Error selecting user: $e');
    }
  }
  void _selectUser3() async {
    try {
      if (_teamId.isEmpty) {
        print('Please add a team first.');
        return;
      }

      // Retrieve user data
      QuerySnapshot usersSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .get();

      // Show a dialog with the list of users to select from
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           // title: Text('Select User'),
            content: SingleChildScrollView(
              child: ListBody(
                children: usersSnapshot.docs.map((userDoc) {
                  String userName = userDoc['name'];
                  return ListTile(
                    title: Text(userName),
                    onTap: () {
                      _addUserToDefender(_teamId, userName);
                      Navigator.pop(context); // Close the dialog
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print('Error selecting user: $e');
    }
  }

  // Function to add user to the team's "Members" subcollection
  void _addUserToGoalKepper(String teamId, String userName) async {
    try {
      // Reference to the Firestore instance
      final firestoreInstance = FirebaseFirestore.instance;

      // Data to be added to the "Members" subcollection
      Map<String, dynamic> memberData = {'name': userName, 'postion' : 'GoalKeeper'};

      // Add the selected user to the "Members" subcollection under the team document
      await firestoreInstance
          .collection('Teams')
          .doc(teamId)
          .collection('Members')
          .add(memberData);

      print('User $userName added to team successfully!');
    } catch (e) {
      print('Error adding user to team: $e');
    }
  }
    void _addUserToForward(String teamId, String userName) async {
    try {
      // Reference to the Firestore instance
      final firestoreInstance = FirebaseFirestore.instance;

      // Data to be added to the "Members" subcollection
      Map<String, dynamic> memberData = {'name': userName, 'postion' : 'Forward'};

      // Add the selected user to the "Members" subcollection under the team document
      await firestoreInstance
          .collection('Teams')
          .doc(teamId)
          .collection('Members')
          .add(memberData);

      print('User $userName added to team successfully!');
    } catch (e) {
      print('Error adding user to team: $e');
    }
  }
    void _addUserToDefender(String teamId, String userName) async {
    try {
      // Reference to the Firestore instance
      final firestoreInstance = FirebaseFirestore.instance;

      // Data to be added to the "Members" subcollection
      Map<String, dynamic> memberData = {'name': userName, 'postion' : 'Defender'};

      // Add the selected user to the "Members" subcollection under the team document
      await firestoreInstance
          .collection('Teams')
          .doc(teamId)
          .collection('Members')
          .add(memberData);

      print('User $userName added to team successfully!');
    } catch (e) {
      print('Error adding user to team: $e');
    }
  }
}