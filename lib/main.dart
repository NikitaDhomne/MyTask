import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_software_lab/provider/user_data_provider.dart';
import 'package:task_software_lab/screens/onboarding_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
