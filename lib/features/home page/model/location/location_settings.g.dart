// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationSettingsAdapter extends TypeAdapter<LocationSettings> {
  @override
  final typeId = 1;

  @override
  LocationSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationSettings(lastLocationPromptDate: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, LocationSettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.lastLocationPromptDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
