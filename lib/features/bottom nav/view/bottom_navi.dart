import 'dart:developer';

import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/widgets/drag_sheet.dart';
import 'package:blood_bank/features/bottom%20nav/components/local_requests.dart';
import 'package:blood_bank/features/bottom%20nav/model/bottom_model.dart';
import 'package:blood_bank/features/home%20page/compoments/request_donor.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_navkit/animated_bottom_navkit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        onPressed: () {
          final existsRequests = BloodRequestHiveManager.getAllRequests();
          log(existsRequests.toString());

          if (existsRequests.isNotEmpty) {
            showCupertinoModalBottomSheet(
              context: context,
              builder: (context) => Material(
                color: Colors.white,
                child: DragSheet(
                  builder: (controller) => LocalRequests(
                    controller: controller,
                    requests: existsRequests,
                  ),
                ),
              ),
            );
          } else {
            navigateTo(context: context, route: const RequestDonor());
          }
        },

        child: const Icon(Icons.add, color: Colors.black),
      ),
      bottomNavigationBar: AnimatedBottomNavkit(
        menuExpandDuration: const Duration(milliseconds: 500),
        middleHexagonIconSize: 25,
        middleHexagonElevation: 15,
        expandedMenuIconSpacing: 25,

        currentIndex: currentIndex,
        items: bottomBarItems,
        onTap: (int index) => setState(() => currentIndex = index),
      ),
      body: pages[currentIndex],
    );
  }
}
