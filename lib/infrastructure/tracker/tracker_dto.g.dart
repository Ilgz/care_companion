// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackerDtoAdapter extends TypeAdapter<_$_TrackerDto> {
  @override
  final int typeId = 1;

  @override
  _$_TrackerDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_TrackerDto(
      date: fields[0] as DateTime,
      height: fields[1] as double,
      weight: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_TrackerDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackerDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
