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

class HeightUnitAdapter extends TypeAdapter<HeightUnit> {
  @override
  final int typeId = 4;

  @override
  HeightUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HeightUnit.centimeter;
      case 1:
        return HeightUnit.inch;
      default:
        return HeightUnit.centimeter;
    }
  }

  @override
  void write(BinaryWriter writer, HeightUnit obj) {
    switch (obj) {
      case HeightUnit.centimeter:
        writer.writeByte(0);
        break;
      case HeightUnit.inch:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeightUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeightUnitAdapter extends TypeAdapter<WeightUnit> {
  @override
  final int typeId = 5;

  @override
  WeightUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WeightUnit.kilogram;
      case 1:
        return WeightUnit.pound;
      default:
        return WeightUnit.kilogram;
    }
  }

  @override
  void write(BinaryWriter writer, WeightUnit obj) {
    switch (obj) {
      case WeightUnit.kilogram:
        writer.writeByte(0);
        break;
      case WeightUnit.pound:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
