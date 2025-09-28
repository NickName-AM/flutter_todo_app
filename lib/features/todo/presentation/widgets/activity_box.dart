// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ActivityBox extends StatefulWidget {
  final String title;
  final String startTime;
  final String endTime;

  const ActivityBox({
    Key? key,
    required this.title,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  State<ActivityBox> createState() => _ActivityBoxState();
}

class _ActivityBoxState extends State<ActivityBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      // decoration: BoxDecoration(border: Border.all()),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              '30 mins',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 15),
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text(
                '${widget.startTime} - ${widget.endTime}',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
