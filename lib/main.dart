import 'dart:developer';

import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/auth/inits/main_inits.dart';
import 'package:blood_bank/features/auth/splash_page.dart';
import 'package:blood_bank/features/auth/view/sign_up.dart';
import 'package:blood_bank/features/bottom%20nav/view/bottom_navi.dart';
import 'package:blood_bank/features/onboard/service/onboard_manager.dart';
import 'package:blood_bank/features/onboard/view/onboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await MainInits.allInits();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank',
      debugShowCheckedModeBanner: false,
      theme: Appthemes.lightTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const SplashPage();
          }

          final bool isVisitedOnboard = OnboardManager.isOnboardVisited();
          log(isVisitedOnboard.toString());
          if (!snap.hasData) {
            return const SignUp();
          }

          if (!isVisitedOnboard) return const OnboardPage();

          return const BottomNavi();
        },
      ),
    );
  }
}
