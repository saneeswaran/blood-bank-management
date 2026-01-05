import 'package:blood_bank/features/home%20page/model/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_request.freezed.dart';
part 'blood_request.g.dart';

@freezed
abstract class BloodRequest with _$BloodRequest {
  const factory BloodRequest({
    String? reqId,
    required String name,
    required String bloodGroup,
    required String phone,
    required String email,
    required Location location,
    required String bloodType,
    required String date,
  }) = _BloodRequest;

  factory BloodRequest.fromJson(Map<String, dynamic> json) =>
      _$BloodRequestFromJson(json);
}
