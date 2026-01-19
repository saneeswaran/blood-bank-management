import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/model/hive/request_blood_hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

class MyBloodRequestHiveManager {
  static const String boxName = "my_blood_request_box";

  static Future<void> init() async {
    await Hive.openBox<RequestBloodHive>(boxName);
  }

  static Box<RequestBloodHive> get _box => Hive.box<RequestBloodHive>(boxName);

  static Future<void> addRequest(BloodRequest request) async {
    final hiveModel = _toHive(request);
    await _box.put(hiveModel.requestId, hiveModel);
  }

  static Future<void> updateRequest(BloodRequest request) async {
    final hiveModel = _toHive(request);
    await _box.put(hiveModel.requestId, hiveModel);
  }

  static Future<void> deleteRequest(String key) async {
    await _box.delete(key);
  }

  static Future<void> clearAll() async {
    await _box.clear();
  }

  static List<BloodRequest> getAllRequests() {
    return _box.values.map(_fromHive).toList();
  }

  static RequestBloodHive _toHive(BloodRequest e) {
    return RequestBloodHive(
      requestId: e.requestId,
      requestedBy: e.requestedBy,
      patientName: e.patientName,
      bloodGroup: e.bloodGroup,
      units: e.units,
      hospitalName: e.hospitalName,
      location: e.location,
      contactPhone: e.contactPhone,
      urgency: e.urgency,
      status: e.status,
      createdAt: e.createdAt,
    );
  }

  static BloodRequest _fromHive(RequestBloodHive e) {
    return BloodRequest(
      requestId: e.requestId,
      requestedBy: e.requestedBy,
      patientName: e.patientName,
      bloodGroup: e.bloodGroup,
      units: e.units,
      hospitalName: e.hospitalName,
      location: e.location,
      contactPhone: e.contactPhone,
      urgency: e.urgency,
      status: e.status,
      createdAt: e.createdAt,
    );
  }
}
