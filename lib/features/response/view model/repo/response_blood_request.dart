import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ResponseBloodRequest {
  Future<Either<Failure, List<UserModel>>> fetchAccesptedDonors();
}
