import 'package:animations/animations.dart';
import 'package:blood_bank/features/bottom%20nav/model/bottom_model.dart';
import 'package:blood_bank/features/home%20page/compoments/request_donor.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OpenContainer(
        openBuilder: (context, action) => const RequestDonor(),
        closedBuilder: (context, onPressed) => FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          onPressed: onPressed,
          child: const Icon(Icons.add, color: Colors.black),
        ),
        closedShape: const CircleBorder(),
      ),
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(iconStyle: IconStyle.animated),
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        notchStyle: NotchStyle.circle,
        items: bottomBarItems,
        onTap: (int index) => setState(() => currentIndex = index),
      ),
      body: pages[currentIndex],
    );
  }
}
