import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:flutter/material.dart';

class LocalRequests extends StatelessWidget {
  final ScrollController controller;
  const LocalRequests({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final requests = BloodRequestHiveManager.getAllRequests();
    return SingleChildScrollView(
      controller: controller,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("You have ${requests.length} local requests"),
            const Text("This request already closed ?"),
            ListView.builder(
              itemCount: requests.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final request = requests[index];
                return ListTile(
                  title:
                      request.patientName != null &&
                          request.patientName!.isNotEmpty
                      ? Text(request.patientName!)
                      : Text(request.bloodGroup),
                  subtitle: Column(
                    children: [
                      Text(request.hospitalName),
                      Text(request.contactPhone),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
