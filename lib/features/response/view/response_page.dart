import 'dart:developer';

import 'package:blood_bank/core/widgets/drag_sheet.dart';
import 'package:blood_bank/core/widgets/loader.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/my_blood_request_notifier.dart';
import 'package:blood_bank/features/response/components/response_tile.dart';
import 'package:blood_bank/features/response/view/blood_request_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ResponsePage extends ConsumerStatefulWidget {
  const ResponsePage({super.key});

  @override
  ConsumerState<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends ConsumerState<ResponsePage> {
  @override
  Widget build(BuildContext context) {
    final requestState = ref.watch(myBloodRequests);
    return Scaffold(
      body: requestState.when(
        data: (requests) {
          log(requests.toString());
          if (requests.isEmpty) {
            log("Inside the empty");
            return const Center(child: Text("No requests found"));
          }
          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return ResponseTile(
                bloodRequest: request,
                onViewResponse: () {
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => DragSheet(
                      builder: (controller) => BloodRequestResponse(
                        requestId: request.requestId!,
                        scrollController: controller,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        error: (error, st) => Center(child: Text(error.toString())),
        loading: () => const Loader(),
      ),
    );
  }
}
