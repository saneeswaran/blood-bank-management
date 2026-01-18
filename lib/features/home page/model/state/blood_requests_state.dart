import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';

part 'blood_requests_state.freezed.dart';

@freezed
abstract class BloodRequestsState with _$BloodRequestsState {
  const factory BloodRequestsState({
    @Default([]) List<BloodRequest> requests,

    @Default(false) bool isLoading,

    @Default(false) bool isLoadingMore,

    @Default(true) bool hasMore,

    String? error,
  }) = _BloodRequestsState;
}
