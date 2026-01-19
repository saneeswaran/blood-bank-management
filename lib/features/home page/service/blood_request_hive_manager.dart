import 'package:blood_bank/features/home page/model/blood request/blood_request.dart';
import 'package:blood_bank/features/home page/model/hive/request_blood_hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

class BloodRequestHiveManager {
  static const String boxName = "blood_request_box";

  static Future<Box<RequestBloodHive>> _getBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<RequestBloodHive>(boxName);
    }
    return Hive.box<RequestBloodHive>(boxName);
  }

  static Future<void> addRequest(BloodRequest bloodRequest) async {
    final box = await _getBox();
    final requestHiveModel = _convertToHiveModel(bloodRequest);
    await box.put(requestHiveModel.requestId, requestHiveModel);
  }

  static Future<void> deleteRequest(int key) async {
    final box = await _getBox();
    await box.delete(key);
  }

  static Future<void> updateRequest(BloodRequest bloodRequest) async {
    final box = await _getBox();
    final requestHiveModel = _convertToHiveModel(bloodRequest);
    await box.put(requestHiveModel.requestId, requestHiveModel);
  }

  static Future<void> clearAll() async {
    final box = await _getBox();
    await box.clear();
  }

  static Future<List<BloodRequest>> getAllRequests() async {
    final box = await _getBox();

    return box.values
        .where((e) => e.status == "pending" || e.status == "Pending")
        .map(
          (e) => BloodRequest(
            requestId: e.requestId,
            requestedBy: e.requestedBy,
            bloodGroup: e.bloodGroup,
            units: e.units,
            hospitalName: e.hospitalName,
            location: e.location,
            contactPhone: e.contactPhone,
            urgency: e.urgency,
            status: e.status,
            createdAt: e.createdAt,
            patientName: e.patientName,
          ),
        )
        .toList();
  }

  static RequestBloodHive _convertToHiveModel(BloodRequest bloodRequest) {
    return RequestBloodHive(
      requestId: bloodRequest.requestId,
      requestedBy: bloodRequest.requestedBy,
      bloodGroup: bloodRequest.bloodGroup,
      units: bloodRequest.units,
      hospitalName: bloodRequest.hospitalName,
      location: bloodRequest.location,
      contactPhone: bloodRequest.contactPhone,
      urgency: bloodRequest.urgency,
      status: bloodRequest.status,
      createdAt: bloodRequest.createdAt,
      patientName: bloodRequest.patientName,
    );
  }
}
