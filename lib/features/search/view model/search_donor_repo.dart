import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SearchDonorRepo {
  Future<List<UserModel>> fetchDonors({
    required String bloodGroup,
    required Map<String, dynamic> location,
    DocumentSnapshot? lastDoc,
  });
}
