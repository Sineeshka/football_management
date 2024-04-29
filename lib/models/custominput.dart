import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputForm extends StatelessWidget {
  final TextEditingController? controller;
  final IconData icon;
  final String label;
  final String hint;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final VoidCallback? onTap;
  final bool? readOnly;
 CustomInputForm(
      {super.key,
      required this.icon,
      required this.label,
      required this.hint,
      this.obscureText,
      this.keyboardType,
      this.maxLines,
      this.onTap,
      this.readOnly,
      this.controller});

  TextStyle mine = GoogleFonts.epilogue(
                fontSize: 16, fontWeight: FontWeight.normal, color: Color.fromARGB(255,101,75,78),);
                TextStyle minee = GoogleFonts.epilogue(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      onTap: onTap,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255,230, 220, 221),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: label,
        labelStyle: mine,
        hintText: hint ,
        hintStyle: mine,
        prefixIcon: Icon(
          icon,
          color: Color.fromARGB(255,101,75,78),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}