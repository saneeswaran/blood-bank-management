import 'package:blood_bank/core/enum/ui_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
abstract class UiState with _$UiState {
  const factory UiState({
    @Default(UiController.idle) UiController state,
    String? message,
  }) = _UiState;
}
