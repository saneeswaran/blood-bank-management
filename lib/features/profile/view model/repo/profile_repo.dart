import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel?>> fetchCurrentUserData();
  Future<Either<Failure, bool>> changeDonorStatus({required bool isDonor});
  Future<Either<Failure, bool>> changeLocationData({
    required Map<String, dynamic> locationData,
  });

  Future<Either<Failure, bool>> updateProfile({required UserModel userModel});
}
