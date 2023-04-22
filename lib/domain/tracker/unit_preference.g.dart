// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitPreferenceAdapter extends TypeAdapter<UnitPreference> {
  @override
  final int typeId = 2;

  @override
  UnitPreference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitPreference(
      heightUnit: fields[0] as HeightUnit,
      weightUnit: fields[1] as WeightUnit,
    );
  }

  @override
  void write(BinaryWriter writer, UnitPreference obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.heightUnit)
      ..writeByte(1)
      ..write(obj.weightUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitPreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
