// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:ffi';

import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final String text;
  final TextEditingController timeController;

  const TimePicker({Key? key, required this.text, required this.timeController})
    : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          final TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: _selectedTime ?? TimeOfDay.now(),
          );
          if (picked != null && picked != _selectedTime) {
            widget.timeController.text = picked.format(context);
          }
          setState(() {});
        },

        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Color.fromRGBO(64, 68, 201, 0.8),
          ),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        child: Text(
          widget.timeController.text == ""
              ? widget.text
              : widget.timeController.text,
        ),
      ),
    );
  }
}
