import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Team'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _teamNameController,
              decoration: InputDecoration(labelText: 'Team Name'),
            ),
            TextField(
              controller: _teamDescriptionController,
              decoration: InputDecoration(labelText: 'Team Description'),
            ),
            TextField(
              controller: _teamLocationController,
              decoration: InputDecoration(labelText: 'Team Location'),
            ),
            ElevatedButton(
              onPressed: () {
                _addTeamData();
              },
              child: Text('Add Team'),
            ),
            SizedBox(height: 20),
            // Text(
            //   'Selected User: $_selectedUserName',
            //   style: TextStyle(fontSize: 18),
            // ),
            ElevatedButton(
              onPressed: () {
                _selectUser();
              },
              child: Text('Select Player'),
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
  void _selectUser() async {
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
                      _addUserToTeam(_teamId, userName);
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
  void _addUserToTeam(String teamId, String userName) async {
    try {
      // Reference to the Firestore instance
      final firestoreInstance = FirebaseFirestore.instance;

      // Data to be added to the "Members" subcollection
      Map<String, dynamic> memberData = {'name': userName};

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