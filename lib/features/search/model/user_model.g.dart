// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String?,
  name: json['name'] as String,
  email: json['email'] as String,
  fcmToken: json['fcmToken'] as String?,
  donationCount: (json['donationCount'] as num?)?.toInt() ?? 0,
  isDonor: json['isDonor'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'fcmToken': instance.fcmToken,
      'donationCount': instance.donationCount,
      'isDonor': instance.isDonor,
    };
