// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthSelectButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final VoidCallback? onPressed;

  const AuthSelectButton({
    Key? key,
    required this.text,
    this.disabled = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(
            color: onPressed != null
                ? Colors.grey.shade400
                : Color.fromRGBO(64, 68, 201, 1),
            width: 2,
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15, horizontal: 32),
        ),
        backgroundColor: WidgetStatePropertyAll(
          onPressed != null ? Colors.white : Colors.blue.shade50,
        ),
      ),

      child: Text(
        text,
        style: TextStyle(
          color: onPressed != null ? Colors.grey.shade500 : Colors.black,
          // fontSize: 14,
        ),
      ),
    );
  }
}
