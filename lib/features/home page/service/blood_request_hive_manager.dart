import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/model/hive/request_blood_hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

class BloodRequestHiveManager {
  static const String boxName = "blood_request_box";
  static final box = Hive.box<RequestBloodHive>(boxName);
  static Future<void> init() async {
    Hive.registerAdapter<RequestBloodHive>(RequestBloodHiveAdapter());
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  static Future<void> addRequest(BloodRequest bloodRequest) async {
    final requestHiveModel = converToHiveModel(bloodRequest);
    await box.put(requestHiveModel.requestId, requestHiveModel);
  }

  static Future<void> deleteRequest(int key) async {
    await box.delete(key);
  }

  static Future<void> updateRequest(BloodRequest bloodRequest) async {
    final requestHiveModel = converToHiveModel(bloodRequest);
    await box.put(requestHiveModel.requestId, requestHiveModel);
  }

  static Future<void> clearAll() async {
    await box.clear();
  }

  static List<BloodRequest> getAllRequests() {
    return box.values
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
