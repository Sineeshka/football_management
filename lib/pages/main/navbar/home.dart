import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255,230, 220, 221),
    );
    
  }
}