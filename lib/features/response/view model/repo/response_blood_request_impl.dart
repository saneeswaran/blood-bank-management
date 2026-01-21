import 'dart:developer';

import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:blood_bank/features/response/view%20model/repo/response_blood_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class ResponseBloodRequestImpl extends ResponseBloodRequest {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<Either<Failure, List<UserModel>>> fetchAccesptedDonors({
    required List<String> donorIds,
  }) async {
    try {
      final query = await userCollection.where("id", whereIn: donorIds).get();
      final data = query.docs.map((e) => UserModel.fromJson(e.data())).toList();
      if (data.isEmpty) {
        return const Left("Request not found");
      }
      return Right(data);
    } catch (e) {
      log("response blood request $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failure, List<AcceptDonation>>> fetchDonationRequests({
    required String requestId,
  }) async {
    try {
      final responseCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("blood_requests")
          .doc(requestId)
          .collection("response");

      final query = await responseCollection.get();
      final data = query.docs
          .map((e) => AcceptDonation.fromJson(e.data()))
          .toList();

      if (data.isEmpty) {
        return const Left("Request not found");
      }
      return Right(data);
    } catch (e) {
      log("response blood request $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failure, bool>> changeStatusOfRequest({
    required String requestId,
    required String status,
  }) async {
    final responseCollection = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("blood_requests")
        .doc(requestId)
        .collection("response");
    try {
      final doc = await responseCollection.doc(requestId).get();

      if (doc.exists) {
        await responseCollection.doc(requestId).update({"status": status});
        return const Right(true);
      } else {
        return const Left("Request not found");
      }
    } catch (e) {
      log("response blood request $e");
      return Left(e.toString());
    }
  }
}
