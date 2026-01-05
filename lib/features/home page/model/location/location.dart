import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    String? id,
    required double latitude,
    required double longitude,
    required String fullAddress,
    required String streetName,
    required String city,
    required String state,
    required int pincode,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
