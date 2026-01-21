import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/view%20model/blood_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class BloodRepoImpl extends BloodRepo {
  final requestRef = FirebaseFirestore.instance.collection('blood_requests');
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<Either<Failure, String>> giveBloodRequst({
    required BloodRequest bloodRequest,
  }) async {
    final userCollectionDoc = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("blood_requests");
    try {
      final docRef = requestRef.doc();
      final id = docRef.id;
      final requst = bloodRequest.copyWith(requestId: id);
      await docRef.set(requst.toJson());
      await userCollectionDoc.doc(id).set(requst.toJson());
      return Right(id);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
