import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function onChanged;
  final bool obscureText;

  CustomTextField({this.label, this.onChanged, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            TextField(
              style: TextStyle(
                fontSize: 20.0,
              ),
              onChanged: onChanged,
              obscureText: obscureText,
            ),
          ],
        ),
      ),
    );
  }
}
