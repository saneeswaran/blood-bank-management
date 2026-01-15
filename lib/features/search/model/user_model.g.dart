// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String?,
  image: json['image'] as String?,
  name: json['name'] as String,
  email: json['email'] as String,
  fcmToken: json['fcmToken'] as String?,
  location: json['location'] as Map<String, dynamic>,
  donationCount: (json['donationCount'] as num?)?.toInt() ?? 0,
  isDonor: json['isDonor'] as bool? ?? false,
  isAvailable: json['isAvailable'] as bool? ?? true,
  lastDonationDate: json['lastDonationDate'] as String?,
  availableFrom: json['availableFrom'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'email': instance.email,
      'fcmToken': instance.fcmToken,
      'location': instance.location,
      'donationCount': instance.donationCount,
      'isDonor': instance.isDonor,
      'isAvailable': instance.isAvailable,
      'lastDonationDate': instance.lastDonationDate,
      'availableFrom': instance.availableFrom,
    };
