import 'package:flutter/material.dart';

class OrLoginText extends StatelessWidget {
  const OrLoginText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'BeVietnamPro',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xffBEBBB8)),
        ));
  }
}
