// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String hintText;
  const SubmitButton({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(color: Color.fromRGBO(64, 68, 201, 1)),
      child: Center(
        child: Text(hintText, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
