import 'package:blood_bank/core/widgets/loader.dart';
import 'package:blood_bank/features/response/model/state/accept_donation_state.dart';
import 'package:blood_bank/features/response/view%20model/notifier/accept_donation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodRequestResponse extends ConsumerStatefulWidget {
  final String requestId;
  final ScrollController scrollController;
  const BloodRequestResponse({
    super.key,
    required this.requestId,
    required this.scrollController,
  });

  @override
  ConsumerState<BloodRequestResponse> createState() =>
      _BloodRequestResponseState();
}

class _BloodRequestResponseState extends ConsumerState<BloodRequestResponse> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(acceptDonationNotifier.notifier)
          .fetchResponseDonation(donationRequestId: widget.requestId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsestate = ref.watch(acceptDonationNotifier);
    return Material(
      color: Colors.white,
      child: responsestate.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Loader(),
        success: (data) {
          if (data.isEmpty) {
            return const Center(child: Text("No response found"));
          }
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            controller: widget.scrollController,
            itemBuilder: (context, index) {
              final response = data[index];

              return Text(response.acceptId);
            },
          );
        },
        error: (error) => Text(error),
      ),
    );
  }
}
