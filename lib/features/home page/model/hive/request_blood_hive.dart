// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_ce_flutter/adapters.dart';

part 'request_blood_hive.g.dart';

@HiveType(typeId: 0)
class RequestBloodHive extends HiveObject {
  @HiveField(0)
  String? requestId;
  @HiveField(1)
  final String requestedBy;
  @HiveField(2)
  String? patientName;
  @HiveField(3)
  final String bloodGroup;
  @HiveField(4)
  final int units;
  @HiveField(5)
  final String hospitalName;
  @HiveField(6)
  final Map<String, dynamic> location;
  @HiveField(7)
  final String contactPhone;
  @HiveField(8)
  /// high / medium / low
  final String urgency;
  @HiveField(9)
  /// active / fulfilled / expired / cancelled
  final String status;
  @HiveField(10)
  /// Firestore timestamps
  final String createdAt;
  RequestBloodHive({
    this.requestId,
    required this.requestedBy,
    this.patientName,
    required this.bloodGroup,
    required this.units,
    required this.hospitalName,
    required this.location,
    required this.contactPhone,
    required this.urgency,
    required this.status,
    required this.createdAt,
  });
}
