// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String?,
  name: json['name'] as String,
  isDonor: json['isDonor'] as bool?,
  email: json['email'] as String,
  fcmToken: json['fcmToken'] as String?,
  donationCount: (json['donationCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isDonor': instance.isDonor,
      'email': instance.email,
      'fcmToken': instance.fcmToken,
      'donationCount': instance.donationCount,
    };
