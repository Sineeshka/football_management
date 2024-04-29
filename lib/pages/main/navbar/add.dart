import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/pages/main/createTeam.dart';
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
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,  
                  children: [
                    GestureDetector(
                    child: Container(
                      height: 50,
                      width: screenSize.width/2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
                      child: Center(
                        child: Text('Create Team',style:GoogleFonts.epilogue(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                      onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTeamPage()));
                   // _TournamentService.savePost(text);
                    //Navigator.pop(context);
                  },
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Container(
                      height: 50,
                      width: screenSize.width/2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromARGB(255,101,75,78),)
                      ),
                      child: Center(
                        child: Text('Create Tournament',style:GoogleFonts.epilogue(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                      onTap: () {
                      Navigator.pushNamed(context, '/tournament');
                      //Navigator.pop(context);
                    },
                    ),
                  ],
              ),
            )
            );
  }
}