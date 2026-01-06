// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodRequest _$BloodRequestFromJson(Map<String, dynamic> json) =>
    _BloodRequest(
      requestId: json['requestId'] as String?,
      requestedBy: json['requestedBy'] as String,
      patientName: json['patientName'] as String?,
      bloodGroup: json['bloodGroup'] as String,
      units: (json['units'] as num).toInt(),
      hospitalName: json['hospitalName'] as String,
      city: json['city'] as String,
      area: json['area'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      contactName: json['contactName'] as String,
      contactPhone: json['contactPhone'] as String,
      urgency: json['urgency'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$BloodRequestToJson(_BloodRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'requestedBy': instance.requestedBy,
      'patientName': instance.patientName,
      'bloodGroup': instance.bloodGroup,
      'units': instance.units,
      'hospitalName': instance.hospitalName,
      'city': instance.city,
      'area': instance.area,
      'location': instance.location,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'urgency': instance.urgency,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
