// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodRequest _$BloodRequestFromJson(Map<String, dynamic> json) =>
    _BloodRequest(
      reqId: json['reqId'] as String?,
      name: json['name'] as String,
      bloodGroup: json['bloodGroup'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      bloodType: json['bloodType'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$BloodRequestToJson(_BloodRequest instance) =>
    <String, dynamic>{
      'reqId': instance.reqId,
      'name': instance.name,
      'bloodGroup': instance.bloodGroup,
      'phone': instance.phone,
      'email': instance.email,
      'location': instance.location,
      'bloodType': instance.bloodType,
      'date': instance.date,
    };
