// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsVOAdapter extends TypeAdapter<DetailsVO> {
  @override
  final int typeId = 11;

  @override
  DetailsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as int?,
      fields[4] as double?,
      fields[5] as int?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsVO obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.bookType)
      ..writeByte(3)
      ..write(obj.pages)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.reviewCount)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.author)
      ..writeByte(9)
      ..write(obj.timeStamp)
      ..writeByte(10)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
