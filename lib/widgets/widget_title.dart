import 'package:flutter/material.dart';

class screen_title extends StatelessWidget {
  const screen_title({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          fontFamily: 'BeVietnamPro'),
    );
  }
}
