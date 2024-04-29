import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255,101,75,78),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255,230, 220, 221),
        ),
        title: Text('Notifications',style: GoogleFonts.epilogue(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      backgroundColor: Color.fromARGB(255,230, 220, 221),
      body: Center(
        child: Container(
          height: screenSize.height-80,
          width: screenSize.width-20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255,101,75,78),
            )
          ),
          child: Center(
            child: Text('No Notifications Yet.',style: GoogleFonts.epilogue(
                    fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
          ),
        ),
      ),
    );
  }
}