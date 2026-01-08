import 'package:blood_bank/features/onboard/service/onboard_manager.dart';
import 'package:blood_bank/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class MainInits {
  static Future<void> allInits() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    //hive inits
    await OnboardManager.init();
  }
}
