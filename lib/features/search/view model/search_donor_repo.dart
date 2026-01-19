import 'package:blood_bank/features/search/model/result/search_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SearchDonorRepo {
  Future<SearchResult> fetchDonors({
    required String bloodGroup,
    required Map<String, dynamic> location,
    DocumentSnapshot<Object?>? lastDoc,
  });
}
