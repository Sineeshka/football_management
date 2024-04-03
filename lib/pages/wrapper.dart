import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/models/user.dart';
import 'package:sample/pages/main/navbar/homepage.dart';
import 'package:sample/pages/main/navbar/add.dart';
import 'package:sample/pages/main/tournament_reg.dart';
import 'package:sample/pages/signup.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user =Provider.of<UserModel?>(context);

    if(user ==null){
      return SignUp();
    }

    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/':(context) => homepage(),
        '/add': (context) => Add(),
        '/tournament':(context) => CreateEventPage(),
        // '/profile': (context) => Profile(),
        // '/edit': (context) => Edit(),
        // '/replies': (context) => Replies()
      },
    );
  }
}