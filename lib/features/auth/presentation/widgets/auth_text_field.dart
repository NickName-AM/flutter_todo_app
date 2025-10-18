// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 60,
          color: Color.fromRGBO(64, 68, 201, 1),
          child: Icon(icon, color: Colors.white),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
