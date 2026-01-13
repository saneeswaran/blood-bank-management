import 'package:blood_bank/core/widgets/custom_drop_down.dart';
import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/features/bottom%20nav/components/request_item.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:flutter/material.dart';

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
                    onChanged: (value) {},
                    labelText: "Change Status",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            CustomElevatedButton(
              onPressed: () {},
              text: "Change Status",
              minSize: true,
            ),
          ],
        ),
      ),
    );
  }
}
