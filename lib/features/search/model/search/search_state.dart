import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<UserModel> donors,
    @Default(false) bool isLoading,
    @Default(true) bool hasMore,
    DocumentSnapshot? lastDoc,
  }) = _SearchState;
}
