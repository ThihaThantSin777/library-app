

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'isbns_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeIsbns)
class IsbnsVO{
  @JsonKey(name: 'isbn10')
  @HiveField(0)
  String ?isbn10;

  @JsonKey(name: 'isbn13')
  @HiveField(1)
  String ?isbn13;

  IsbnsVO(this.isbn10, this.isbn13);

  factory IsbnsVO.fromJson(Map<String,dynamic>json)=>_$IsbnsVOFromJson(json);

  Map<String,dynamic>toJson()=>_$IsbnsVOToJson(this);

  @override
  String toString() {
    return 'IsbnsVO{isbn10: $isbn10, isbn13: $isbn13}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IsbnsVO &&
          runtimeType == other.runtimeType &&
          isbn10 == other.isbn10 &&
          isbn13 == other.isbn13;

  @override
  int get hashCode => isbn10.hashCode ^ isbn13.hashCode;
}