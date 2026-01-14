import 'package:blood_bank/features/home%20page/model/location/location_settings.dart';
import 'package:hive_ce/hive_ce.dart';

class UpdateLocationManager {
  static const String locationBox = "locationBox";

  static final box = Hive.box<LocationSettings>(locationBox);

  Future<void> safeInits() async {
    try {
      Hive.registerAdapter<LocationSettings>(LocationSettingsAdapter());
      await Hive.openBox<LocationSettings>(locationBox);
    } catch (e) {
      Hive.registerAdapter<LocationSettings>(LocationSettingsAdapter());
      await Hive.openBox<LocationSettings>(locationBox);
    }
  }

  Future<bool> shouldAskLocationUpdate() async {
    final box = Hive.box<LocationSettings>(locationBox);

    final settings = box.get(locationBox, defaultValue: LocationSettings());

    final today = DateTime.now().toIso8601String().substring(0, 10);

    if (settings?.lastLocationPromptDate == null) return true;

    return settings!.lastLocationPromptDate != today;
  }

  Future<void> saveTodayAsAsked() async {
    final box = Hive.box<LocationSettings>(locationBox);
    final today = DateTime.now().toIso8601String().substring(0, 10);

    await box.put(locationBox, LocationSettings(lastLocationPromptDate: today));
  }
}
