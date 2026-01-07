import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class BloodRequstService {
  static final user = FirebaseAuth.instance.currentUser;

  static final requestCollection = FirebaseFirestore.instance.collection(
    'requests',
  );

  static Future<Either<Failure, bool>> giveBloodRequst({
    required BuildContext context,
    required BloodRequest request,
  }) async {
    try {
      if (user == null) {
        return const Left("User not found");
      }
      final doc = requestCollection.doc();
      final BloodRequest bloodRequest = BloodRequest(
        requestId: doc.id,
        requestedBy: user!.uid,
        bloodGroup: request.bloodGroup,
        units: request.units,
        hospitalName: request.hospitalName,
        location: request.location,
        contactPhone: request.contactPhone,
        urgency: request.urgency,
        status: request.status,
        createdAt: request.createdAt,
        patientName: request.patientName,
      );
      await doc.set(bloodRequest.toJson());
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<Failure, bool>> cancelRequst({
    required String requestId,
    required String status,
  }) async {
    if (user == null) return const Left("User not found");
    try {
      final doc = await requestCollection
          .where('requestId', isEqualTo: requestId)
          .where("requestedBy", isEqualTo: user!.uid)
          .limit(1)
          .get();

      if (doc.docs.isNotEmpty) {
        await doc.docs.first.reference.update({"status": status});
        return const Right(true);
      } else {
        return const Left("Request not found");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
