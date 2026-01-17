import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpdart/fpdart.dart';

class ProfileService {
  static final collectionRef = FirebaseFirestore.instance.collection("users");
  static final user = FirebaseAuth.instance.currentUser;

  static Future<Either<Failure, bool>> createUser({
    required String email,
    required String userName,
    required bool isDonor,
    required Map<String, dynamic> locationData,
    required int phone,
    required String bloodGroup,
    required int age,
    required String gender,
    required double weight,
  }) async {
    try {
      if (user == null) {
        return const Left("User not found");
      }
      final doc = collectionRef.doc(user!.uid);
      final UserModel userModel = UserModel(
        id: doc.id,
        name: userName,
        email: email,
        fcmToken: await FirebaseMessaging.instance.getToken(),
        location: locationData,
        phone: phone,
        isDonor: isDonor,
        bloodGroup: bloodGroup,
        age: age,
        donationCount: 0,
        gender: gender,

        isAvailable: false,
        weight: weight,
      );

      await doc.set(userModel.toJson());
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
