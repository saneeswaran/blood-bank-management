import 'package:cloud_firestore/cloud_firestore.dart';
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

    required Map<String, dynamic> location,
    required int contactPhone,

    /// high / medium / low
    required String urgency,

    /// active / fulfilled / expired / cancelled
    required String status,

    /// Firestore timestamps
    required String createdAt,

    @JsonKey(ignore: true) DocumentSnapshot<Map<String, dynamic>>? snapshot,
  }) = _BloodRequest;

  factory BloodRequest.fromJson(Map<String, dynamic> json) =>
      _$BloodRequestFromJson(json);
}
