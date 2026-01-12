import 'dart:developer';

import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/features/profile/model/state/user_state.dart';
import 'package:blood_bank/features/profile/view%20model/profile_repo.dart';
import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final profileNotifier = StateNotifierProvider<ProfileNotifier, UserState>((
  ref,
) {
  return ProfileNotifier()..fetchUserData();
});

class ProfileNotifier extends StateNotifier<UserState> {
  ProfileNotifier() : super(const UserState.initial());

  Future<void> fetchUserData() async {
    try {
      state = const UserState.loading();
      final result = await ProfileRepo.fetchCurrentUserData();

      result?.fold(
        (error) {
          log(error);
        },
        (userData) {
          state = UserState.loaded(userData);
        },
      );
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }

  Future<void> changeDonorStatus({
    required BuildContext context,
    required bool isDonor,
  }) async {
    final UserModel? user = state.maybeWhen(
      loaded: (user) => user,
      orElse: () => null,
    );

    try {
      state = const UserState.loading();

      final result = await ProfileRepo.changeDonorStatus(isDonor: isDonor);

      result.fold(
        (error) {
          log(error);
          customSnackBar(
            context: context,
            content: error,
            type: SnackType.error,
          );
        },
        (success) {
          final updatedData = user?.copyWith(isDonor: isDonor);
          state = UserState.loaded(updatedData);
        },
      );
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }
}
