import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:fpdart/fpdart.dart';

abstract class AcceptedDonationRepo {
  Future<Either<Failure, bool>> giveAcceptRequst({
    required String donationRequestId,
  });

  Future<Either<Failure, List<AcceptDonation>>> fetchMyAcceptDonations();
}
