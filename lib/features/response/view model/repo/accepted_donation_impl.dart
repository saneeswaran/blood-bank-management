import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:blood_bank/features/response/view%20model/repo/accepted_donation_repo.dart';
import 'package:fpdart/fpdart.dart';

class AcceptedDonationImpl extends AcceptedDonationRepo {
  @override
  Future<Either<Failure, List<AcceptDonation>>> fetchMyAcceptDonations() async {
    try {
      final userAccpetedCollection = firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("accepted_requests");

      final snapshot = await userAccpetedCollection.get();

      final data = snapshot.docs
          .map((e) => AcceptDonation.fromJson(e.data()))
          .toList();

      if (data.isEmpty) {
        return const Left("Request not found");
      }
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failure, bool>> giveAcceptRequst({
    required String donationRequestId,
  }) async {
    try {
      //inside the response
      final collection = firestore
          .collection("blood_request")
          .doc(donationRequestId)
          .collection("response");

      //inside the userCollection AcceptedFields

      final userAccpetedCollection = firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("accepted_requests");

      final doc = collection.doc();

      final acceptedData = AcceptDonation(
        donationRequestId: donationRequestId,
        acceptId: doc.id,
        userId: auth.currentUser!.uid,
        status: "pending",
      );

      await userAccpetedCollection.doc(doc.id).set(acceptedData.toJson());

      await doc.set(acceptedData.toJson());

      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failure, List<AcceptDonation>>> fetchResponseDonations({
    required String donationRequestId,
  }) async {
    try {
      final collection = firestore
          .collection("blood_request")
          .doc(donationRequestId)
          .collection("response");

      final quries = await collection.get();

      if (quries.docs.isNotEmpty) {
        final data = quries.docs
            .map((e) => AcceptDonation.fromJson(e.data()))
            .toList();
        return Right(data);
      } else {
        return const Left("No response found");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> fetchUserAcceptedDonation({
    required List<String> userId,
  }) async {
    try {
      final queries = await userCollection.where("id", whereIn: userId).get();

      if (queries.docs.isNotEmpty) {
        final data = queries.docs
            .map((e) => UserModel.fromJson(e.data()))
            .toList();

        return Right(data);
      } else {
        return const Left("No user found");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
