// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_blood_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestBloodHiveAdapter extends TypeAdapter<RequestBloodHive> {
  @override
  final typeId = 0;

  @override
  RequestBloodHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequestBloodHive(
      requestId: fields[0] as String?,
      requestedBy: fields[1] as String,
      patientName: fields[2] as String?,
      bloodGroup: fields[3] as String,
      units: (fields[4] as num).toInt(),
      hospitalName: fields[5] as String,
      location: (fields[6] as Map).cast<String, dynamic>(),
      contactPhone: (fields[7] as num).toInt(),
      urgency: fields[8] as String,
      status: fields[9] as String,
      createdAt: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RequestBloodHive obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.requestId)
      ..writeByte(1)
      ..write(obj.requestedBy)
      ..writeByte(2)
      ..write(obj.patientName)
      ..writeByte(3)
      ..write(obj.bloodGroup)
      ..writeByte(4)
      ..write(obj.units)
      ..writeByte(5)
      ..write(obj.hospitalName)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.contactPhone)
      ..writeByte(8)
      ..write(obj.urgency)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestBloodHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
