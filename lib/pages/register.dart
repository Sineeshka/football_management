import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiver/testing/time.dart';
import 'package:sample/pages/main/navbar/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/pages/signin.dart';
import 'package:sample/services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final TextEditingController _dateController = TextEditingController();

  String email='';
  String password='';
  String name='';
  String dob='';
  DateTime selectedDate=DateTime(2020);

void _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null && picked != selectedDate) {
    setState(() {
      selectedDate = picked;
      _dateController.text = DateFormat('dd-MM-yyyy').format(picked).toString();
      dob=_dateController.text;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
     appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 8,
  centerTitle: true,
  title: Text("REGISTER", style: GoogleFonts.epilogue(color: Colors.black)),
),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0,8, 0, 8),
                  child: Container(
                     
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage('lib/images/register.jpg'),
                      fit: BoxFit.contain,)),    
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Form(child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                        onChanged: (value) => setState(() {
                          name=value;
                        }),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'abcd@gmail.com',
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                        onChanged: (value) => setState(() {
                          email=value;
                        }),
                      ),
                      SizedBox(height: 10,),

                      TextFormField(
  controller: _dateController, // Use the TextEditingController
  readOnly: true, // Make the text field read-only to prevent manual input
  onTap: () => _selectDate(context), // Show date picker on tap
  decoration: InputDecoration(
    hintText: 'dd-mm-yyyy',
    labelText: 'BirthDate',
    border: OutlineInputBorder(),
    suffixIcon: IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () => _selectDate(context), // Show date picker when icon is tapped
    ),
  ),
),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //   labelText: 'BirthDate',
                      //   border: OutlineInputBorder(),
                      // ),
                      //   onChanged: (value) => setState(() {
                      //     dob=value;
                      //   }),
                      // ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                        hintText: "pass-word",
                        labelText: 'PassWord',
                        border: OutlineInputBorder(),
                      ),
                        onChanged: (value) => setState(() {
                          password=value;
                        }),
                      ),
                      SizedBox(height: 10,),
                  
                      GestureDetector(
                                onTap: () async =>{
                                await _authService.register(name,email,password,dob),
                                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
                                // Navigator.removeRouteBelow(context, MaterialPageRoute(builder: (context)=>Register())),
                                // Navigator.pushNamed(context, '/')
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  width: screenSize.width-20,
                                  height: 55,
                                  //color: Colors.black,
                                  child: Center(
                    child: Text(
                      ' REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                                  ),
                                ),
                              ),
                  
                  
                  
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       OutlinedButton(
                    //     style: ButtonStyle(
                    //       side: MaterialStateProperty.all<BorderSide>(
                    //   BorderSide(
                    //     color: Colors.black,
                    //     width: 1.0,
                    //   ),
                    // ),
                    // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //       RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(5.0),
                    //         // You can adjust other properties like border color, etc. here
                    //       ),
                    //     ),),
                    //     onPressed: () async=>{
                    //   _authService.register(name,email,password,dob),
                    // }, child: Text("Register",style: TextStyle(color: Colors.black))),
                    //   SizedBox(height: 10,width: 10,),
                    //   OutlinedButton(
                    //     style: ButtonStyle(
                    //       side: MaterialStateProperty.all<BorderSide>(
                    //   BorderSide(
                    //     color: Colors.black,
                    //     width: 1.0,
                    //   ),
                    // ),
                    // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //       RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(5.0),
                    //         // You can adjust other properties like border color, etc. here
                    //       ),
                    //     ),),
                    //     onPressed: () async=>{
                    //   _authService.signIn(email, password)
                    // }, child: Text("Sign In",style: TextStyle(color: Colors.black))),
                    //     ],
                    //   )
                    // ElevatedButton(onPressed: () async=>{
                    //   _authService.Register(email, password),
                    //   //  Navigator.push(
                    //   //   context,
                    //   //   MaterialPageRoute(builder: (context) => homepage()),
                    //   // )
                    // }, child: Text("Sign Up")),
                    // ElevatedButton(
                    //   //style: ButtonStyle(),
                    //   onPressed: () async=>{
                    //   _authService.signIn(email, password)
                    // }, child: Text("Sign In"))
                  Row(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                      GestureDetector(child: Text('already registered?',textAlign: TextAlign.right,),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                    }), 
                    ],
                  )
                  
                  ],
                  )),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}