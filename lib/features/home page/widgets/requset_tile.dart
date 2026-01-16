import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:flutter/material.dart';

class RequsetTile extends StatelessWidget {
  final BloodRequest bloodRequest;
  const RequsetTile({super.key, required this.bloodRequest});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: size.height * 0.15,
        width: size.width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
              width: size.width * 1,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Text(bloodRequest.bloodGroup),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
