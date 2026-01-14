// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_ce_flutter/adapters.dart';

part 'location_settings.g.dart';

@HiveType(typeId: 1)
class LocationSettings extends HiveObject {
  @HiveField(0)
  String? lastLocationPromptDate;
  LocationSettings({this.lastLocationPromptDate});
}
