// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  final TextEditingController titleController;
  final String hintText;

  const SimpleTextField({
    Key? key,
    required this.titleController,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: EdgeInsets.all(25),
      ),
    );
  }
}
