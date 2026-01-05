import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/onboard/view/onboard_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank',
      debugShowCheckedModeBanner: false,
      theme: Appthemes.lightTheme,
      home: const OnboardPage(),
    );
  }
}
