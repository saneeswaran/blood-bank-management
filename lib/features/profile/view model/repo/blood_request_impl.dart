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
  Future<Either<Failure, List<BloodRequest>>> fetchBloodrequests({
    int limit = 10,
    DocumentSnapshot? lastDoc,
  }) async {
    try {
      Query query = requestRef
          .where("requestedBy", isEqualTo: userId)
          .orderBy("createdAt", descending: true)
          .limit(limit);

      if (lastDoc != null) {
        query = query.startAfterDocument(lastDoc);
      }

      final snapshot = await query.get();

      final requests = snapshot.docs
          .map((e) => BloodRequest.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      for (final req in requests) {
        await BloodRequestHiveManager.addRequest(req);
      }

      return Right(requests);
    } catch (e) {
      return Left(e.toString());
    }
  }

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
}
