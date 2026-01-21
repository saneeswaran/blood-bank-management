// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AcceptDonation _$AcceptDonationFromJson(Map<String, dynamic> json) =>
    _AcceptDonation(
      donationRequestId: json['donationRequestId'] as String,
      acceptId: json['acceptId'] as String,
      userId: json['userId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AcceptDonationToJson(_AcceptDonation instance) =>
    <String, dynamic>{
      'donationRequestId': instance.donationRequestId,
      'acceptId': instance.acceptId,
      'userId': instance.userId,
      'status': instance.status,
    };
