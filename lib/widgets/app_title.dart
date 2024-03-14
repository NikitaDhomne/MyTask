import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget implements PreferredSizeWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'FarmerEats',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'BeVietnamPro'),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
