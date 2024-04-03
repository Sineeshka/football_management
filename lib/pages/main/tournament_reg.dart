import 'dart:io';
import 'dart:typed_data';
// import 'package:king/screens/main/image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:sample/models/auth/custom_headtext.dart';
// import 'package:king/screens/auth/custom_input_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:firebase_core/firebase_core.dart';
// import 'package:king/screens/main/image.dart';
// import 'package:king/screens/main/tournament.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample/models/customheadtext.dart';
import 'package:sample/models/custominput.dart';
import 'package:sample/services/tournament.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {

  FilePickerResult? _filePickerResult;
  bool _isInPersonEvent = true;

  final TournamentService save = TournamentService();
  final String id = FirebaseAuth.instance.currentUser!.uid;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  //for date and time

 Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute);
        setState(() {
          dateTimeController.text = selectedDateTime.toString();
        });
      }
    }

  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    setState(() {
      _filePickerResult = result;
    });
  }
  final CollectionReference events = FirebaseFirestore.instance.collection('events');
  //Uint8List? _image;
  // void createtournament() {
  //   // Uint8List img =  pickImage(ImageSource.gallery);
  //  // setState(() {
  //   //  _image = img;
  //  // });

  //   final data = {'name':nameController.text,'description':descController.text,'location': locationController.text,'datetime': dateTimeController.text};


  //   events.add(data);

  // }

  
 /* void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
        child:Padding(padding: const EdgeInsets.all(12.0), 
        child:Column(  crossAxisAlignment: CrossAxisAlignment.start,children:[
          // SizedBox(
          //   height: 50,
          // ),
          CustomHeadText(text: "Create Tournament"),
          SizedBox(
            height: 25,
          ),
         GestureDetector(
            onTap: ()=>_openFilePicker(),
           child: Container(width: double.infinity,
            height: MediaQuery.of(context).size.height*.3,
            decoration: BoxDecoration(
            color: Colors.yellow,borderRadius: BorderRadius.circular(8) ),
            child: _filePickerResult!=null?
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(image: FileImage(File(_filePickerResult!.files.first.path!)),
              fit: BoxFit.fill,),
            ):
             Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_a_photo_outlined,size:42,color: Colors.black,),
              SizedBox(height: 8,),
              Text("Add Tournament Image",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)
            ]),
          ),
          ),
          SizedBox(
              height: 8,
            ),
          CustomInputForm(
          
            controller: nameController,
            icon: Icons.sports_football_outlined, label: "Tournament Name", hint:"Add Tournament Name"),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
             // maxLines: 4,
              controller: descController,
            icon: Icons.description_outlined, label: "Description", hint:"Add description"),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
              controller:  locationController,
            icon: Icons.location_on_outlined, label: "Location", hint:"Enter Location of Tournament"),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
              controller: dateTimeController,
            icon: Icons.date_range_outlined,
             label: "Date & Time", 
             hint:"Pickup Date & Time",
             onTap: ()=>_selectDateTime(context),),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
            
           child: MaterialButton(
              color: Colors.blueGrey,
              onPressed: (){
                save.createtournament(nameController.text,descController.text, locationController.text,dateTimeController.text,id);
                Navigator.pop(context);
              },
            child: Text("Create New One",style: TextStyle(color: Colors.black,fontSize: 20),),)
            ),
        ]),
        ),
      
      ),
    );
  }
}