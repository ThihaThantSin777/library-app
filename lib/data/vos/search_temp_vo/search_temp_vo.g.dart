// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_temp_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchTempVOAdapter extends TypeAdapter<SearchTempVO> {
  @override
  final int typeId = 10;

  @override
  SearchTempVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchTempVO(
      fields[0] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchTempVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchTempVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
