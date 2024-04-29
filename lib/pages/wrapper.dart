import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/models/user.dart';
import 'package:sample/pages/main/createTeam.dart';
import 'package:sample/pages/main/navbar/homepage.dart';
import 'package:sample/pages/main/navbar/add.dart';
import 'package:sample/pages/main/navbar/tempprofile.dart';
import 'package:sample/pages/main/tournament_reg.dart';
import 'package:sample/pages/register.dart';
import 'package:sample/pages/register.dart';
import 'package:sample/pages/first.dart';
import 'package:sample/pages/signin.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user =Provider.of<UserModel?>(context);

    if(user ==null){
      return Login_Screen();
      //SignUp();
    }

    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/':(context) => homepage(),
        '/add': (context) => Add(),
        '/tournament':(context) => CreateEventPage(),
        '/addteam':(context) => AddTeamPage(),
         '/teamprofile': (context) => temp(),
        // '/edit': (context) => Edit(),
        // '/replies': (context) => Replies()
      },
    );
  }
}