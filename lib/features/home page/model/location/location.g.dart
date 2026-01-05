// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  id: json['id'] as String?,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  fullAddress: json['fullAddress'] as String,
  streetName: json['streetName'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  pincode: (json['pincode'] as num).toInt(),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'id': instance.id,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'fullAddress': instance.fullAddress,
  'streetName': instance.streetName,
  'city': instance.city,
  'state': instance.state,
  'pincode': instance.pincode,
};
