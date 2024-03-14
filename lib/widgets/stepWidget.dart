import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      title,
      style: TextStyle(
          fontFamily: 'BeVietnamPro',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xffBEBBB8)),
    ));
  }
}
