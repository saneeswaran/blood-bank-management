import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/model/hive/request_blood_hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

class BloodRequestHiveManager {
  static const String boxName = "blood_request_box";
  static Future<void> init() async {
    Hive.registerAdapter<RequestBloodHive>(RequestBloodHiveAdapter());
    await Hive.openBox<RequestBloodHive>(boxName);
  }

  static Future<void> addRequest(BloodRequest bloodRequest) async {
    final box = Hive.box<RequestBloodHive>(boxName);
    final requestHiveModel = converToHiveModel(bloodRequest);
    await box.put(requestHiveModel.requestId, requestHiveModel);
  }

  static Future<void> deleteRequest(int key) async {
    final box = Hive.box<RequestBloodHive>(boxName);
    await box.delete(key);
  }

  static Future<void> updateRequest(BloodRequest bloodRequest) async {
    final box = Hive.box<RequestBloodHive>(boxName);
    final requestHiveModel = converToHiveModel(bloodRequest);
    await box.put(requestHiveModel.requestId, requestHiveModel);
  }

  static Future<void> clearAll() async {
    final box = Hive.box<RequestBloodHive>(boxName);
    await box.clear();
  }

  static List<BloodRequest> getAllRequests() {
    final box = Hive.box<RequestBloodHive>(boxName);
    return box.values
        .where((e) => e.status == "pending" || e.status == "Pending")
        .toList()
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

  static RequestBloodHive converToHiveModel(BloodRequest bloodRequest) {
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
