import 'package:flutter/material.dart';

class SubtitleWithButton extends StatelessWidget {
  const SubtitleWithButton(
      {super.key,
      required this.title1,
      required this.title2,
      required this.onPressed});
  final String title1;
  final String title2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title1,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffBEBBB8),
              fontFamily: 'BeVietnamPro'),
        ),
        GestureDetector(
            onTap: onPressed,
            child: Text(
              title2,
              style: TextStyle(
                  color: Color(0xffD5715B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'BeVietnamPro'),
            ))
      ],
    );
  }
}
