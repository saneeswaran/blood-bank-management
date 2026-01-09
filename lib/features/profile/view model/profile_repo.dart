import 'dart:developer';

import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepo {
  static final userCollection = FirebaseFirestore.instance.collection("users");
  static final userId = FirebaseAuth.instance.currentUser!.uid;
  static Future<UserModel?> fetchCurrentUserData() async {
    try {
      final userData = await userCollection.doc(userId).get();
      return UserModel.fromJson(userData.data()!);
    } catch (e) {
      log("profile repo $e");
      return null;
    }
  }

  static Future<void> changeDonorStatus({required bool isDonor}) async {
    try {
      await userCollection.doc(userId).update({"isDonor": isDonor});
    } catch (e) {
      log("profile repo $e");
    }
  }
}
