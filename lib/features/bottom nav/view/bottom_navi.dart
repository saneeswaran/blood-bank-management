import 'dart:developer';

import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/widgets/drag_sheet.dart';
import 'package:blood_bank/features/bottom nav/components/local_requests.dart';
import 'package:blood_bank/features/bottom nav/model/bottom_model.dart';
import 'package:blood_bank/features/home page/compoments/request_donor.dart';
import 'package:blood_bank/features/home page/service/blood_request_hive_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      barColor: Colors.white,
      hideOnScroll: true,
      body: (context, controller) => Scaffold(
        extendBody: true,
        body: pages[currentIndex],
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: FloatingActionButton(
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
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(bottomBarItems.length, (index) {
          final item = bottomBarItems[index];

          return IconButton(
            icon: Icon(
              item.icon,
              color: currentIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            onPressed: () {
              setState(() => currentIndex = index);
            },
          );
        }),
      ),
    );
  }
}
