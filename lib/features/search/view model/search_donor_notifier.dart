import 'package:blood_bank/features/search/model/search/search_state.dart';
import 'package:blood_bank/features/search/view%20model/search_donor_impl.dart';
import 'package:blood_bank/features/search/view%20model/search_donor_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/legacy.dart';

class SearchDonorNotifier extends StateNotifier<SearchState> {
  final SearchDonorRepo repository;

  SearchDonorNotifier(this.repository) : super(const SearchState());

  Future<void> fetchDonors({
    required String bloodGroup,
    required Map<String, dynamic> location,
    bool loadMore = false,
  }) async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);

    final lastDoc = loadMore ? state.lastDoc : null;
    final donors = await repository.fetchDonors(
      bloodGroup: bloodGroup,
      location: location,
      lastDoc: lastDoc,
    );

    state = state.copyWith(
      donors: loadMore ? [...state.donors, ...donors] : donors,
      isLoading: false,
      hasMore: donors.length == SearchDonorImpl.pageSize,
      lastDoc: donors.isNotEmpty ? donors.lastDoc : state.lastDoc,
    );
  }
}

final donorProvider = StateNotifierProvider<SearchDonorNotifier, SearchState>(
  (ref) => SearchDonorNotifier(SearchDonorImpl(FirebaseFirestore.instance)),
);
