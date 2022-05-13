// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelve_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelveVOAdapter extends TypeAdapter<ShelveVO> {
  @override
  final int typeId = 12;

  @override
  ShelveVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelveVO(
      fields[0] as String?,
      (fields[1] as List?)?.cast<DetailsVO>(),
      fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ShelveVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.shelveName)
      ..writeByte(1)
      ..write(obj.detailsVO)
      ..writeByte(2)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelveVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
