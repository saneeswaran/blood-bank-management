import 'dart:developer';

import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/widgets/custom_drop_down.dart';
import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/features/bottom%20nav/components/request_item.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final changeRequestLoader = StateProvider<bool>((ref) => false);

class ChangeRequestStatus extends StatefulWidget {
  final ScrollController scrollController;
  final BloodRequest bloodRequest;
  const ChangeRequestStatus({
    super.key,
    required this.bloodRequest,
    required this.scrollController,
  });

  @override
  State<ChangeRequestStatus> createState() => _ChangeRequestStatusState();
}

class _ChangeRequestStatusState extends State<ChangeRequestStatus> {
  String? status;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RequestItem(request: widget.bloodRequest, navigate: false),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update Request Status",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 16),

                  CustomDropDown(
                    items: const [
                      DropdownMenuItem(
                        value: "fulfilled",
                        child: Text("Fulfilled"),
                      ),
                      DropdownMenuItem(
                        value: "cancelled",
                        child: Text("Cancelled"),
                      ),
                    ],
                    value: status,
                    onChanged: (value) {
                      setState(() {
                        status = value;
                        log(value!.toLowerCase());
                      });
                    },
                    labelText: "Change Status",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Consumer(
              builder: (context, ref, child) {
                final loader = ref.watch(changeRequestLoader);
                return CustomElevatedButton(
                  onPressed: () async {
                    await changeStatus(ref: ref, context: context);
                  },
                  isLoading: loader,
                  text: "Change Status",
                  minSize: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> changeStatus({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final notifier = ref.read(bloodRequestsNotifier.notifier);
    final loaderNotifier = ref.read(changeRequestLoader.notifier);
    try {
      if (status == null) {
        customSnackBar(
          context: context,
          content: "Please Select Status",
          type: SnackType.info,
        );
        return;
      }
      loaderNotifier.state = true;
      final result = await BloodRequestImpl().changeRequestStatus(
        status: status!,
        requestId: widget.bloodRequest.requestId!,
      );
      result.fold(
        (error) {
          loaderNotifier.state = false;
          customSnackBar(
            context: context,
            content: error,
            type: SnackType.error,
          );
        },
        (success) {
          if (success) {
            notifier.changeRequestStatus(
              requestId: widget.bloodRequest.requestId!,
              status: status!,
            );
            customSnackBar(
              context: context,
              content: "Request Status Changed Successfully",
              type: SnackType.success,
            );
          }
        },
      );
      loaderNotifier.state = false;
      if (!context.mounted) return;
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      log(e.toString());
    }
  }
}
