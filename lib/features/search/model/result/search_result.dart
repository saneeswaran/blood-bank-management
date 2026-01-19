import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchResult {
  final List<UserModel> donors;
  final DocumentSnapshot<Object?>? lastDoc;

  SearchResult({required this.donors, required this.lastDoc});
}
