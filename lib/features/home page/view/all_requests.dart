import 'package:blood_bank/features/home%20page/widgets/requset_tile.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllRequests extends ConsumerStatefulWidget {
  const AllRequests({super.key});

  @override
  ConsumerState<AllRequests> createState() => _AllRequestsState();
}

class _AllRequestsState extends ConsumerState<AllRequests> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(bloodRequestsNotifier.notifier).fetchMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bloodRequestsNotifier);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: state.requests.length + (state.hasMore ? 1 : 0),
        (context, index) {
          if (index == state.requests.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final request = state.requests[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: RequestTile(
              bloodRequest: request,
              onAccept: () {},
              onContact: () {},
            ),
          );
        },
      ),
    );
  }
}
