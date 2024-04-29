import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/models/custominput.dart';

class temp extends StatefulWidget {
  const temp({super.key});

  @override
  State<temp> createState() => _tempState();
}

class _tempState extends State<temp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _regfeeController = TextEditingController();
  //final TextEditingController _contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _nameController.text = args['name'].toUpperCase();
    _descController.text = args['description'];
    _locationController.text = args['location'];
    _dateTimeController.text = args['datetime'];
     _regfeeController.text = args['host'];
    //_regfeeController.text = args['fee'];
    //_contactController.text = args['phnumber'];
    //final tournamentId = args['id'];
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
          
        return Column(
          children: [
            CustomInputForm(
           // maxLines: 4,
            readOnly: true,
            controller: _nameController,
          icon: Icons.sports_soccer_outlined, label: "Contact number", hint:"Add Contact number"),
          SizedBox(
            height: 8,
          ),
          CustomInputForm(
           // maxLines: 4,
            readOnly: true,
            controller: _descController,
          icon: Icons.note, label: "Contact number", hint:"Add Contact number"),
          SizedBox(
            height: 8,
          ),
          CustomInputForm(
           // maxLines: 4,
            readOnly: true,
            controller: _locationController,
          icon: Icons.location_pin, label: "Contact number", hint:"Add Contact number"),
          SizedBox(
            height: 8,
          ),
          CustomInputForm(
           // maxLines: 4,
            readOnly: true,
            controller: _dateTimeController,
          icon: Icons.calendar_month, label: "Contact number", hint:"Add Contact number"),
          SizedBox(
            height: 8,
          ),
          CustomInputForm(
           // maxLines: 4,
            readOnly: true,
            controller: _regfeeController,
          icon: Icons.person, label: "Contact number", hint:"Add Contact number"),
          ],
        );
        }
        return Center(child: CircularProgressIndicator());
        }
      ),  
    );
  }
}