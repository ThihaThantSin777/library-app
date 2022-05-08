// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_more_hive_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViewMoreHiveVOAdapter extends TypeAdapter<ViewMoreHiveVO> {
  @override
  final int typeId = 9;

  @override
  ViewMoreHiveVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViewMoreHiveVO(
      (fields[0] as List?)?.cast<ViewMoreVO>(),
      fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ViewMoreHiveVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.listViewMoreVO)
      ..writeByte(1)
      ..write(obj.numResult);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewMoreHiveVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
