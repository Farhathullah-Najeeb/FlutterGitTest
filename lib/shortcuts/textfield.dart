// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';

class TextFiels extends StatelessWidget {
  final String Htext;
  final TextEditingController cntrl;
  final TextInputType txtTyp;
  final int maxLength;

  const TextFiels({
    Key? key,
    required this.Htext,
    required this.cntrl, required this.txtTyp, required this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      maxLength: maxLength,
      controller: cntrl,
      keyboardType: txtTyp,
      maxLines: 1,
      decoration: InputDecoration(
          hintText: Htext,


          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.redAccent))),
    );
  }
}
