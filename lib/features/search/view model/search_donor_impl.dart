import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:blood_bank/features/search/model/result/search_result.dart';
import 'package:blood_bank/features/search/view model/search_donor_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDonorImpl extends SearchDonorRepo {
  final FirebaseFirestore _firestore;

  SearchDonorImpl(this._firestore);

  static const int pageSize = 10;

  Future<QuerySnapshot<Object?>> _queryDonors({
    required String bloodGroup,
    required String field,
    required dynamic value,
    DocumentSnapshot<Object?>? lastDoc,
  }) async {
    Query<Object?> query = _firestore
        .collection('users')
        .where('bloodGroup', isEqualTo: bloodGroup)
        .where('isDonor', isEqualTo: true)
        .where('isAvailable', isEqualTo: true)
        .where(field, isEqualTo: value)
        .orderBy('name')
        .limit(pageSize);

    if (lastDoc != null) {
      query = query.startAfterDocument(lastDoc);
    }

    return await query.get();
  }

  @override
  Future<SearchResult> fetchDonors({
    required String bloodGroup,
    required Map<String, dynamic> location,
    DocumentSnapshot<Object?>? lastDoc,
  }) async {
    /// SEARCH PRIORITY (as requested)
    final searchOrder = ['village', 'city', 'pincode', 'state'];

    for (final field in searchOrder) {
      final value = location[field];
      if (value == null) continue;

      final snapshot = await _queryDonors(
        bloodGroup: bloodGroup,
        field: field,
        value: value,
        lastDoc: lastDoc,
      );

      if (snapshot.docs.isNotEmpty) {
        final donors = snapshot.docs.map((doc) {
          return UserModel.fromJson({
            ...doc.data() as Map<String, dynamic>,
            'id': doc.id,
          });
        }).toList();

        return SearchResult(donors: donors, lastDoc: snapshot.docs.last);
      }
    }

    return SearchResult(donors: const [], lastDoc: lastDoc);
  }
}
