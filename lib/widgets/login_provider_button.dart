import 'package:flutter/material.dart';

class Buildloginprovider extends StatelessWidget {
  const Buildloginprovider({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Color(0xffDFE5EA),
          ),
        ),
        height: screenHeight * 0.06,
        width: screenWidth * 0.25,
        alignment: Alignment.center,
        child: Container(
            child: Image.asset(
          image,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
