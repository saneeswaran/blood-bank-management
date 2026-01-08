import 'dart:developer';

import 'package:hive_ce_flutter/adapters.dart';

class OnboardManager {
  static final boxName = 'localBox';
  static final onboardVisitedKey = 'onboardVisited';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  static bool isOnboardVisited() {
    return Hive.box(boxName).get(onboardVisitedKey) ?? false;
  }

  static Future<void> setOnboardVisited() async {
    await Hive.box(boxName).put(onboardVisitedKey, true);
    log("set onboard visited true");
  }
}
