import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:fpdart/fpdart.dart';

abstract class ResponseBloodRequest {
  Future<Either<Failure, List<UserModel>>> fetchAccesptedDonors({
    required List<String> donorIds,
  });

  Future<Either<Failure, List<AcceptDonation>>> fetchDonationRequests({
    required String requestId,
  });

  Future<Either<Failure, bool>> changeStatusOfRequest({
    required String requestId,
    required String status,
  });
}
