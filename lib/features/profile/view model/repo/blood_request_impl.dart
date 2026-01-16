import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class BloodRequestImpl extends BloodRequestRepo {
  final requestRef = FirebaseFirestore.instance.collection('blood_requests');

  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<Either<Failure, bool>> changeRequestStatus({
    required String status,
    required String requestId,
  }) async {
    try {
      await requestRef.doc(requestId).update({"status": status});
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failure, List<BloodRequest>>> fetchBloodrequests() async {
    try {
      final queries = await requestRef
          .where("requestedBy", isEqualTo: userId)
          .get();

      if (queries.docs.isNotEmpty) {
        final requests = queries.docs
            .map((e) => BloodRequest.fromJson(e.data()))
            .toList();

        for (final req in requests) {
          await BloodRequestHiveManager.addRequest(req);
        }
        return Right(requests);
      } else {
        return const Left("Request not found");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
