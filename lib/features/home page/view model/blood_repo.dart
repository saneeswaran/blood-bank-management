import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

class BloodRepo {
  static final requestRef = FirebaseFirestore.instance.collection(
    'blood_requests',
  );

  static Future<Either<Failure, bool>> giveBloodRequst({
    required BloodRequest bloodRequest,
  }) async {
    try {
      final docRef = requestRef.doc();

      final requst = bloodRequest.copyWith(requestId: docRef.id);
      await docRef.set(requst.toJson());
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
