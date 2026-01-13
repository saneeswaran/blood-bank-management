import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/bottom%20nav/components/request_item.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:flutter/material.dart';

class LocalRequests extends StatelessWidget {
  final List<BloodRequest> requests;
  final ScrollController controller;

  const LocalRequests({
    super.key,
    required this.controller,
    required this.requests,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Appthemes.primaryColor,
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('New Request', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Appthemes.primaryColor.withOpacity(0.06),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Old Requests',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Appthemes.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${requests.length} request(s)',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            if (requests.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'No blood requests yet',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              ...requests.map((request) => RequestItem(request: request)),
          ],
        ),
      ),
    );
  }
}
