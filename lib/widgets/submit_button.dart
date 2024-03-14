import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.buttonName,
    required this.onPressed,
  });

  final double screenHeight;
  final double screenWidth;
  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xffD5715B),
        ),
        height: screenHeight * 0.06,
        width: screenWidth * 1,
        alignment: Alignment.center,
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'BeVietnamPro'),
        ),
      ),
    );
  }
}
