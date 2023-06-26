import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
              text: 'Tic',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 60,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Tac',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 60,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Toe',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 60,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
