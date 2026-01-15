import 'dart:developer';

import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/widgets/drag_sheet.dart';
import 'package:blood_bank/features/bottom%20nav/components/local_requests.dart';
import 'package:blood_bank/features/bottom%20nav/model/bottom_model.dart';
import 'package:blood_bank/features/home%20page/compoments/request_donor.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter_animated_navkit/animated_bottom_navkit.dart';
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
    return Scaffold(
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              elevation: 1.5,
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
            )
          : const SizedBox.shrink(),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: currentIndex,
        animationCurve: Curves.bounceInOut,
        items: bottomBarItems,
        onItemSelected: (int index) => setState(() => currentIndex = index),
        showElevation: false,
      ),
      body: pages[currentIndex],
    );
  }
}
