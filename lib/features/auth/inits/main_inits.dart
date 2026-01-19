import 'package:blood_bank/features/home%20page/model/hive/request_blood_hive.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:blood_bank/features/home%20page/service/my_blood_request_hive_manager.dart';
import 'package:blood_bank/features/onboard/service/onboard_manager.dart';
import 'package:blood_bank/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_ce_flutter/adapters.dart';

class MainInits {
  static Future<void> allInits() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(RequestBloodHiveAdapter());
    }

    await OnboardManager.init();
    await BloodRequestHiveManager.init();
    await MyBloodRequestHiveManager.init();
  }
}
