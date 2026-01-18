import 'dart:developer';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final myBloodRequests =
    StateNotifierProvider<
      MyBloodRequestNotifier,
      AsyncValue<List<BloodRequest>>
    >((ref) => MyBloodRequestNotifier());

class MyBloodRequestNotifier
    extends StateNotifier<AsyncValue<List<BloodRequest>>> {
  MyBloodRequestNotifier() : super(const AsyncData([]));

  Future<void> fetchMyRequests(BuildContext context) async {
    try {
      state = const AsyncValue.loading();

      final result = await BloodRequestImpl().fetchMyBloodrequests();

      result.fold(
        (error) {
          log(error);
        },
        (data) {
          state = AsyncData(data);
        },
      );
    } catch (e) {
      log("My blood request notifier $e");
      state = AsyncError(e, StackTrace.current);
    }
  }
}
