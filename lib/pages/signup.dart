import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/pages/main/navbar/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();

  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 8,
        title: Text("Sign Up",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
          child: Center(
            child: Form(child: Column(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      // You can adjust other properties like border color, etc. here
                    ),
                  ),),
                  onPressed: () async=>{
                _authService.signUp(email, password),
              }, child: Text("Sign Up",style: TextStyle(color: Colors.black))),
                SizedBox(height: 10,width: 10,),
                OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      // You can adjust other properties like border color, etc. here
                    ),
                  ),),
                  onPressed: () async=>{
                _authService.signIn(email, password)
              }, child: Text("Sign In",style: TextStyle(color: Colors.black))),
                  ],
                )
              // ElevatedButton(onPressed: () async=>{
              //   _authService.signUp(email, password),
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
            ],)),
          ),
        ),
      ),
    );
  }
}