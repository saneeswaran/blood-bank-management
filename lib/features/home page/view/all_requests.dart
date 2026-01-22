import 'package:blood_bank/core/animations/list/list_of_blood_request_loader.dart';
import 'package:blood_bank/features/home%20page/widgets/request_tile.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';

class AllRequests extends ConsumerWidget {
  final ScrollController scrollController;

  const AllRequests({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bloodRequestsNotifier);
    final notifier = ref.read(bloodRequestsNotifier.notifier);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 200 &&
            state.hasMore &&
            !state.isLoadingMore) {
          log("🔥 PAGINATION FETCH");
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
            log(state.requests.toString());
            final request = state.requests[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RequestTile(
                bloodRequest: request,
                onAccept: () async {},
                onContact: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
