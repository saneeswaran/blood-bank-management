import 'dart:developer';

import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class BloodRequestRepo {
  static final requestRef = FirebaseFirestore.instance.collection(
    'blood_requests',
  );

  static final userId = FirebaseAuth.instance.currentUser!.uid;

  static Future<Either<Failure, List<BloodRequest>>>
  fetchBloodrequests() async {
    try {
      final queries = await requestRef
          .where("requestId", isEqualTo: userId)
          .get();

      if (queries.docs.isNotEmpty) {
        log(queries.docs.length.toString());
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

  static Future<Either<Failure, bool>> changeRequestStatus({
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
