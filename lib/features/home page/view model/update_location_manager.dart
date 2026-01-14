import 'package:blood_bank/features/home%20page/model/location/location_settings.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive_ce/hive_ce.dart';

final updateLocationLoader = StateProvider.autoDispose<bool>((ref) => false);

final askLocationUpdateRequestNotifier =
    StateNotifierProvider<UpdateLocationManager, bool>(
      (ref) => UpdateLocationManager(),
    );

class UpdateLocationManager extends StateNotifier<bool> {
  UpdateLocationManager() : super(false);

  static const String boxName = "locationBox";
  static const String keyName = "settings";

  late Box<LocationSettings> box;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(LocationSettingsAdapter().typeId)) {
      Hive.registerAdapter(LocationSettingsAdapter());
    }

    box = await Hive.openBox<LocationSettings>(boxName);
    await checkShouldAsk();
  }

  Future<void> checkShouldAsk() async {
    final settings = box.get(keyName);

    final today = DateTime.now().toIso8601String().substring(0, 10);

    if (settings == null || settings.lastLocationPromptDate != today) {
      state = true;
    } else {
      state = false;
    }
  }

  Future<void> saveTodayAsAsked() async {
    final today = DateTime.now().toIso8601String().substring(0, 10);

    await box.put(keyName, LocationSettings(lastLocationPromptDate: today));

    state = false;
  }
}
