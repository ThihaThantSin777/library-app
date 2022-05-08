// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListsVOAdapter extends TypeAdapter<ListsVO> {
  @override
  final int typeId = 3;

  @override
  ListsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListsVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as int?,
      fields[7] as int?,
      (fields[8] as List?)?.cast<BooksVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ListsVO obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.listID)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.update)
      ..writeByte(5)
      ..write(obj.listImage)
      ..writeByte(6)
      ..write(obj.listImageWidth)
      ..writeByte(7)
      ..write(obj.listImageHeight)
      ..writeByte(8)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsVO _$ListsVOFromJson(Map<String, dynamic> json) => ListsVO(
      json['list_id'] as int?,
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['display_name'] as String?,
      json['update'] as String?,
      json['list_image'] as String?,
      json['list_image_width'] as int?,
      json['list_image_height'] as int?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListsVOToJson(ListsVO instance) => <String, dynamic>{
      'list_id': instance.listID,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'update': instance.update,
      'list_image': instance.listImage,
      'list_image_width': instance.listImageWidth,
      'list_image_height': instance.listImageHeight,
      'books': instance.books,
    };
