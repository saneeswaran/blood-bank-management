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
    if (state.isLoading || (loadMore && !state.hasMore)) return;

    if (!loadMore) {
      state = const SearchState(isLoading: true);
    } else {
      state = state.copyWith(isLoading: true);
    }

    try {
      final result = await repository.fetchDonors(
        bloodGroup: bloodGroup,
        location: location,
        lastDoc: loadMore ? state.lastDoc : null,
      );

      state = state.copyWith(
        donors: loadMore ? [...state.donors, ...result.donors] : result.donors,
        lastDoc: result.lastDoc,
        hasMore: result.donors.length == SearchDonorImpl.pageSize,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final searchDonorNotifier =
    StateNotifierProvider<SearchDonorNotifier, SearchState>(
      (ref) => SearchDonorNotifier(SearchDonorImpl(FirebaseFirestore.instance)),
    );
