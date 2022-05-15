
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'lists_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeLists)
class ListsVO{
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int ?listID;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String ?listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String ?listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String ?displayName;

  @JsonKey(name: 'update')
  @HiveField(4)
  String ?update;

  @JsonKey(name: 'list_image')
  @HiveField(5)
  String ?listImage;

  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  int ?listImageWidth;

  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  int ?listImageHeight;

  @JsonKey(name: 'books')
  @HiveField(8)
  List<BooksVO>?books;
  factory ListsVO.fromJson(Map<String,dynamic>json)=>_$ListsVOFromJson(json);

  Map<String,dynamic>toJson()=>_$ListsVOToJson(this);
  ListsVO(
      this.listID,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.update,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.books);

  @override
  String toString() {
    return 'ListsVO{listID: $listID, listName: $listName, listNameEncoded: $listNameEncoded, displayName: $displayName, update: $update, listImage: $listImage, listImageWidth: $listImageWidth, listImageHeight: $listImageHeight, books: $books}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListsVO &&
          runtimeType == other.runtimeType &&
          listID == other.listID &&
          listName == other.listName &&
          listNameEncoded == other.listNameEncoded &&
          displayName == other.displayName &&
          update == other.update &&
          listImage == other.listImage &&
          listImageWidth == other.listImageWidth &&
          listImageHeight == other.listImageHeight &&
          listEquals(books, other.books);

  @override
  int get hashCode =>
      listID.hashCode ^
      listName.hashCode ^
      listNameEncoded.hashCode ^
      displayName.hashCode ^
      update.hashCode ^
      listImage.hashCode ^
      listImageWidth.hashCode ^
      listImageHeight.hashCode ^
      books.hashCode;
}