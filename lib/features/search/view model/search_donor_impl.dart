import 'dart:developer';

import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:blood_bank/features/search/model/result/search_result.dart';
import 'package:blood_bank/features/search/view model/search_donor_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDonorImpl extends SearchDonorRepo {
  final FirebaseFirestore _firestore;

  SearchDonorImpl(this._firestore);

  static const int pageSize = 10;

  /// ---------------------------------------------
  /// INTERNAL QUERY METHOD WITH FULL LOGS
  /// ---------------------------------------------
  Future<QuerySnapshot<Object?>> _queryDonors({
    required String bloodGroup,
    required String field,
    required dynamic value,
    DocumentSnapshot<Object?>? lastDoc,
  }) async {
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', name: 'SEARCH_QUERY');

    log('QUERY STARTED', name: 'SEARCH_QUERY');
    log('Blood Group : $bloodGroup', name: 'SEARCH_QUERY');
    log('Filter      : $field = $value', name: 'SEARCH_QUERY');
    log('Page Size   : $pageSize', name: 'SEARCH_QUERY');
    log('Last Doc    : ${lastDoc?.id ?? "NONE"}', name: 'SEARCH_QUERY');

    Query<Object?> query = _firestore
        .collection('users')
        .where('bloodGroup', isEqualTo: bloodGroup)
        .where('isDonor', isEqualTo: true)
        .where('isAvailable', isEqualTo: true)
        .where(field, isEqualTo: value)
        .orderBy('name')
        .limit(pageSize);

    if (lastDoc != null) {
      log('Pagination applied → startAfterDocument', name: 'SEARCH_QUERY');
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.get();

    log('QUERY COMPLETED', name: 'SEARCH_QUERY');
    log('Documents Found : ${snapshot.docs.length}', name: 'SEARCH_QUERY');
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', name: 'SEARCH_QUERY');

    return snapshot;
  }

  /// ---------------------------------------------
  /// PUBLIC METHOD
  /// ---------------------------------------------
  @override
  Future<SearchResult> fetchDonors({
    required String bloodGroup,
    required Map<String, dynamic> location,
    DocumentSnapshot<Object?>? lastDoc,
  }) async {
    log('══════════════════════════════════', name: 'FETCH_DONORS');
    log('FETCH DONORS STARTED', name: 'FETCH_DONORS');
    log('Blood Group : $bloodGroup', name: 'FETCH_DONORS');
    log('Location    : $location', name: 'FETCH_DONORS');
    log('Last Doc    : ${lastDoc?.id ?? "NONE"}', name: 'FETCH_DONORS');

    /// PRIORITY ORDER (REQUESTED)
    final searchOrder = [
      'location.village',
      'location.city',
      'location.pincode',
      'location.state',
    ];

    try {
      for (final field in searchOrder) {
        final rawField = field.split('.').last;
        final value = location[rawField];

        log('Checking field → $field', name: 'FETCH_DONORS');

        /// Skip null or empty strings
        if (value == null || (value is String && value.trim().isEmpty)) {
          log('Skipped $field (null or empty)', name: 'FETCH_DONORS');
          continue;
        }

        final snapshot = await _queryDonors(
          bloodGroup: bloodGroup,
          field: field,
          value: value,
          lastDoc: lastDoc,
        );

        if (snapshot.docs.isNotEmpty) {
          log('MATCH FOUND using $field', name: 'FETCH_DONORS');

          final donors = snapshot.docs.map((doc) {
            log('Donor Found → ${doc.id}', name: 'FETCH_DONORS');

            return UserModel.fromJson({
              ...doc.data() as Map<String, dynamic>,
              'id': doc.id,
            });
          }).toList();

          log('Returning ${donors.length} donors', name: 'FETCH_DONORS');
          log('══════════════════════════════════', name: 'FETCH_DONORS');

          return SearchResult(donors: donors, lastDoc: snapshot.docs.last);
        }

        log('No donors found for $field = $value', name: 'FETCH_DONORS');
      }

      log('NO DONORS FOUND IN ANY PRIORITY', name: 'FETCH_DONORS');
      log('══════════════════════════════════', name: 'FETCH_DONORS');

      return SearchResult(donors: const [], lastDoc: lastDoc);
    } catch (e, stack) {
      log(
        'ERROR WHILE FETCHING DONORS',
        name: 'FETCH_DONORS',
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }
}
