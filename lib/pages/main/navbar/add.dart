import 'package:flutter/material.dart';
import 'package:sample/pages/main/tournament_reg.dart';
import 'package:sample/services/posts.dart';
import 'package:sample/services/tournament.dart';
//import 'package:sample/services/posts.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final TournamentService _TournamentService = TournamentService();
  String text = '';
  
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child:Center(
              child: Column(
                children: [ElevatedButton(
                    //textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/tournament');
                      //Navigator.pop(context);
                    },
                    child: Text('create tournament')),
                    ElevatedButton(
                  //textColor: Colors.white,
                  onPressed: () async {
                   // _TournamentService.savePost(text);
                    //Navigator.pop(context);
                  },
                  child: Text('create team'))],
                    
              ),
            )
            );
  }
}