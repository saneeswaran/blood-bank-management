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
        locationData: locationData,
      );

      await doc.set(userModel.toJson());
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
