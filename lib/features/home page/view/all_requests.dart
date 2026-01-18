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

    return Scaffold(
      appBar: AppBar(title: const Text('All Requests')),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          if (state.requests.isEmpty) {
            return const Center(child: Text('No requests found'));
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: state.requests.length + (state.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              // Pagination loader
              if (index == state.requests.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final request = state.requests[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListTile(
                  title: Text(request.patientName ?? 'Unknown'),
                  subtitle: Text(
                    '${request.bloodGroup} • ${request.hospitalName}',
                  ),
                  trailing: Text(request.status),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
