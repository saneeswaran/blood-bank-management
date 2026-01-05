import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(""),
            ),
          ],
        ),
      ),
    );
  }
}
