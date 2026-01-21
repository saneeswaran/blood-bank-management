import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_donation.freezed.dart';
part 'accept_donation.g.dart';

@freezed
abstract class AcceptDonation with _$AcceptDonation {
  const factory AcceptDonation({
    required String donationRequestId,
    required String acceptId,
    required String userId,
    required String status,
  }) = _AcceptDonation;

  factory AcceptDonation.fromJson(Map<String, dynamic> json) =>
      _$AcceptDonationFromJson(json);
}
