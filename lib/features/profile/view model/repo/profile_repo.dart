import 'dart:developer';

import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepo {
  static final userCollection = FirebaseFirestore.instance.collection("users");
  static final userId = FirebaseAuth.instance.currentUser!.uid;
  static Future<Either<Failure, UserModel>?> fetchCurrentUserData() async {
    try {
      final userData = await userCollection.doc(userId).get();
      return Right(UserModel.fromJson(userData.data()!));
    } catch (e) {
      log("profile repo $e");
      return Left(e.toString());
    }
  }

  static Future<Either<Failure, bool>> changeDonorStatus({
    required bool isDonor,
  }) async {
    try {
      await userCollection.doc(userId).update({"isDonor": isDonor});
      return const Right(true);
    } catch (e) {
      log("profile repo $e");
      return Left(e.toString());
    }
  }

  static Future<Either<Failure, bool>> changeLocationData({
    required Map<String, dynamic> locationData,
  }) async {
    try {
      final doc = userCollection.doc(userId);
      await doc.update({"locationData": locationData});
      return const Right(true);
    } catch (e) {
      log("profile repo $e");
      return Left(e.toString());
    }
  }
}
