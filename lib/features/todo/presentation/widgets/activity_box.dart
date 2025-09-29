// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  bool _isTapped = false;
  bool isChecked = false;

  TimeOfDay _formatTime(String time1) {
    return TimeOfDay.fromDateTime(DateFormat("HH:mm:ss").parse(time1));
  }

  int _calculateTimeDifference(String time1, String time2) {
    final startTime = _formatTime(time1);
    final endTime = _formatTime(time2);

    int startMinutes = startTime.hour * 60 + startTime.minute;
    int endMinutes = endTime.hour * 60 + endTime.minute;

    int diffMinutes = endMinutes - startMinutes;

    return diffMinutes;
  }

  @override
  Widget build(BuildContext context) {
    final startTimeFormatted = _formatTime(widget.startTime);
    final endTimeFormatted = _formatTime(widget.endTime);

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
              '${_calculateTimeDifference(widget.startTime, widget.endTime)} mins',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_isTapped) {
                    _isTapped = false;
                  } else {
                    _isTapped = true;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _isTapped
                      ? Color.fromRGBO(64, 68, 201, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
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
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: _isTapped ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${startTimeFormatted.format(context)} - ${endTimeFormatted.format(context)}',
                          style: TextStyle(
                            color: _isTapped ? Colors.white60 : Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
