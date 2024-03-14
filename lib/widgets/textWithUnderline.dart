import 'package:flutter/material.dart';

class TextWithUnderline extends StatelessWidget {
  const TextWithUnderline({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'BeVietnamPro'),
      ),
    );
  }
}
