import 'dart:developer';

import 'package:blood_bank/core/animations/list/list_of_blood_request_loader.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/features/home%20page/widgets/request_tile.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:blood_bank/features/response/view%20model/repo/accepted_donation_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllRequests extends ConsumerStatefulWidget {
  final ScrollController scrollController;

  const AllRequests({super.key, required this.scrollController});

  @override
  ConsumerState<AllRequests> createState() => _AllRequestsState();
}

class _AllRequestsState extends ConsumerState<AllRequests> {
  bool _isAccepting = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bloodRequestsNotifier);
    final notifier = ref.read(bloodRequestsNotifier.notifier);
    if (state.requests.isEmpty && !state.isLoading) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text("No requests found", style: TextStyle(fontSize: 16)),
        ),
      );
    }

    log(FirebaseAuth.instance.currentUser!.uid);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 200 &&
            state.hasMore &&
            !state.isLoadingMore) {
          log("PAGINATION FETCH");
          notifier.fetchMore();
        }
        return false;
      },
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: state.requests.length + (state.hasMore ? 1 : 0),
          (context, index) {
            if (index == state.requests.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: ListOfBloodRequestLoader()),
              );
            }

            final request = state.requests[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RequestTile(
                bloodRequest: request,
                onAccept: _isAccepting
                    ? null
                    : () => _onAccept(requestId: request.requestId.toString()),
                onContact: () {},
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onAccept({required String requestId}) async {
    if (_isAccepting) return;

    setState(() => _isAccepting = true);

    MaterialUtil.showFullScreenLoader(context);

    try {
      final result = await AcceptedDonationImpl().giveAcceptRequst(
        donationRequestId: requestId,
      );

      result.fold(
        (error) {
          log(error);
        },
        (data) {
          log(data.toString());
        },
      );
    } catch (e) {
      log(e.toString());
    } finally {
      if (mounted && Navigator.canPop(context)) {
        navigateBack(context);
      }
      if (mounted) {
        setState(() => _isAccepting = false);
      }
    }
  }
}
