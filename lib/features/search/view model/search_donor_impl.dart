import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:blood_bank/features/search/view%20model/search_donor_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDonorImpl extends SearchDonorRepo {
  final FirebaseFirestore _firestore;

  SearchDonorImpl(this._firestore);

  static const int pageSize = 10;

  Future<List<QueryDocumentSnapshot>> _queryDonors({
    required String bloodGroup,
    required String field,
    required dynamic value,
    DocumentSnapshot? lastDoc,
  }) async {
    Query query = _firestore
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

    final snapshot = await query.get();
    return snapshot.docs;
  }

  @override
  Future<List<UserModel>> fetchDonors({
    required String bloodGroup,
    required Map<String, dynamic> location,
    DocumentSnapshot? lastDoc,
  }) async {
    final searchFields = ['streetName', 'city', 'state', 'pincode'];

    for (final field in searchFields) {
      final value = location[field];
      if (value == null) continue;

      final docs = await _queryDonors(
        bloodGroup: bloodGroup,
        field: field,
        value: value,
        lastDoc: lastDoc,
      );

      if (docs.isNotEmpty) {
        return docs
            .map(
              (doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();
      }
    }

    return [];
  }
}
