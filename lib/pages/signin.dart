import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/pages/main/navbar/homepage.dart';
import 'package:sample/services/auth.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _authService=AuthService();
  String email='';
  String password='';
  @override

   Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 8,
        centerTitle: true,
        title: Text("SIGNIN",style: GoogleFonts.epilogue(color:Colors.black)),
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,8, 0, 8),
                child: Container(
                   
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage('lib/images/signin.jpg'),
                    fit: BoxFit.contain,)),
                    
                   
                    
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
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
              
                      GestureDetector(
                                        onTap: () async => {
                                           await _authService.signIn(email,password),
                                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
                                           // Handle tap action here
                                        //  print('Container tapped!');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.black,
                                          ),
                                          width: screenSize.width-20,
                                          height: 55,
                                          child: Center(
                            child: Text(
                              'SIGN IN',
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
                  ],)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}