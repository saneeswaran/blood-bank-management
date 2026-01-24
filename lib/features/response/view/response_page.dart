import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:blood_bank/features/response/components/response_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponsePage extends ConsumerStatefulWidget {
  const ResponsePage({super.key});

  @override
  ConsumerState<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends ConsumerState<ResponsePage> {
  @override
  Widget build(BuildContext context) {
    final requestState = ref.watch(bloodRequestsNotifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            requestState.requests.isEmpty
                ? const Center(child: Text("No requests found"))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final request = requestState.requests[index];
                      return ResponseTile(
                        bloodRequest: request,
                        onViewResponse: () {},
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
