import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:fpdart/fpdart.dart';

abstract class BloodRepo {
  Future<Either<Failure, String>> giveBloodRequst({
    required BloodRequest bloodRequest,
  });
}
