import 'package:flutter/material.dart';

class CustomHeadText extends StatefulWidget {
  final String text;
  const CustomHeadText({super.key,required this.text});

  @override
  State<CustomHeadText> createState() => _CustomHeadTextState();
}

class _CustomHeadTextState extends State<CustomHeadText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: Colors.black,fontSize: 32,fontWeight: FontWeight.w600,
      ),
    );
  }
}