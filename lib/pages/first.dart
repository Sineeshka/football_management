import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sample/pages/register.dart';
import 'package:sample/pages/signin.dart';


class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 8, 80, 8),
                child: Container(
                   
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage('lib/images/first.jpg'),
                    fit: BoxFit.contain,)),
                    
                   
                    
                ),
              ),
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child:Column(
                      children:[ Text(
                    'FOOTBALL360',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 24.0,),
                    
                                ),
                            SizedBox(height: 25,),    
                      Text('"Stay Ahead of the Game with'),
                      Text('Us:Where Every Kick Counts!"'),   
                      SizedBox(
                        height: 10,
                      ),       
                      ],
                      ),            
                    ),
                  ),
                  // Container(
                  //    width:double.infinity,
                  //    height: 100,
                  //    color: Colors.grey,
                  //   child: Column(
                  //     children: [
                  //       SizedBox(height: 15,),
                  //       ElevatedButton(onPressed: (){}, child: Text('REGISTER')),
                  //       SizedBox(height: 15,),
                  //       ElevatedButton(onPressed: (){}, child: Text('SIGN IN')),
                  //     ],
                  //   ),
                  // ),
                  
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      SizedBox(height:25),
                      GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()),);
                                    // Handle tap action here
                                 //   print('Container tapped!');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    width: screenSize.width-20,
                                    height: 55,
                                    //color: Colors.white,
                                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height:10),
                      GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Signin()));
                                    // Handle tap action here
                                  //  print('Container tapped!');
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
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                                    ),
                                  ),
                                ),

                    ],
                  ),
                ),
               
            ],
          ),
        )),
    );
  }
}