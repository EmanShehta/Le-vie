import 'package:flutter/material.dart';

class Textfiled extends StatelessWidget {
  //final int type;
  final String hinttext;
  final IconData icondata;

  const Textfiled(
      {
      // @required this.type,
      required this.hinttext,
      required this.icondata});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 380,
        height: 70,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextFormField(
            onChanged: (v) {},
            style: TextStyle(
              fontSize: 18,
              color: Colors.green,
            ),
            cursorColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
