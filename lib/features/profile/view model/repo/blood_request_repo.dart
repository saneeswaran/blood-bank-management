import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

abstract class BloodRequestRepo {
  Future<Either<Failure, List<BloodRequest>>> fetchBloodrequests({
    int limit = 10,
    DocumentSnapshot? lastDoc,
  });

  Future<Either<Failure, bool>> changeRequestStatus({
    required String status,
    required String requestId,
  });
}
