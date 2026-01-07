import 'package:blood_bank/features/home%20page/model/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_request.freezed.dart';
part 'blood_request.g.dart';

@freezed
abstract class BloodRequest with _$BloodRequest {
  const factory BloodRequest({
    String? requestId,

    required String requestedBy,
    String? patientName,

    required String bloodGroup,

    required int units,

    required String hospitalName,

    required Location location,

    required String contactPhone,

    /// high / medium / low
    required String urgency,

    /// active / fulfilled / expired / cancelled
    required String status,

    /// Firestore timestamps
    required String createdAt,
  }) = _BloodRequest;

  factory BloodRequest.fromJson(Map<String, dynamic> json) =>
      _$BloodRequestFromJson(json);
}
