import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:blood_bank/features/response/view%20model/repo/response_blood_request.dart';
import 'package:fpdart/fpdart.dart';

class ResponseBloodRequestImpl extends ResponseBloodRequest {
  @override
  Future<Either<Failure, List<UserModel>>> fetchAccesptedDonors({
    required String donationId,
  }) async {
    // TODO: implement fetchAccesptedDonors
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AcceptDonation>>> fetchDonationRequests({
    required String requestId,
  }) async {
    // TODO: implement fetchDonationRequests
    throw UnimplementedError();
  }
}
