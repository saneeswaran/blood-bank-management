import 'dart:developer';

import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/widgets/drag_sheet.dart';
import 'package:blood_bank/features/bottom%20nav/components/local_requests.dart';
import 'package:blood_bank/features/bottom%20nav/model/bottom_model.dart';
import 'package:blood_bank/features/home%20page/compoments/request_donor.dart';
import 'package:blood_bank/features/home%20page/service/my_blood_request_hive_manager.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/my_blood_request_notifier.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter_animated_navkit/animated_bottom_navkit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomNavi extends ConsumerStatefulWidget {
  const BottomNavi({super.key});

  @override
  ConsumerState<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends ConsumerState<BottomNavi> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      ref.read(myBloodRequests.notifier).fetchMyRequests(context);
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: currentIndex == 0
          ? Consumer(
              builder: (context, ref, child) {
                return FloatingActionButton(
                  elevation: 1.5,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  onPressed: () {
                    //TODO manager this with firebase and local
                    final existsRequests =
                        MyBloodRequestHiveManager.getAllRequests();
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
                );
              },
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
