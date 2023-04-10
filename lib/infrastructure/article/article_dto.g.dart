// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleDtoAdapter extends TypeAdapter<_$_ArticleDto> {
  @override
  final int typeId = 0;

  @override
  _$_ArticleDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ArticleDto(
      image: fields[3] as String,
      body: fields[2] as String,
      name: fields[1] as String,
      date: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ArticleDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(0)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
