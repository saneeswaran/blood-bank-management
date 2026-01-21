import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'accept_donation_state.freezed.dart';

@freezed
class AcceptDonationState with _$AcceptDonationState {
  const factory AcceptDonationState.initial() = _Initial;
  const factory AcceptDonationState.loading() = _Loading;
  const factory AcceptDonationState.success(List<AcceptDonation> donors) =
      _Success;
  const factory AcceptDonationState.error(String message) = _Error;
}
