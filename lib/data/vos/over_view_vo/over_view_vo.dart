
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/over_view_vo/lists_vo.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'over_view_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeOverView)
class OverViewVO{
  @JsonKey(name: 'bestsellers_date')
  @HiveField(0)
  String? bestsellersDate;

  @JsonKey(name: 'published_date')
  @HiveField(1)
  String? publishedDate;

  @JsonKey(name: 'published_date_description')
  @HiveField(2)
  String? publishedDateDescription;

  @JsonKey(name: 'previous_published_date')
  @HiveField(3)
  String? previousPublishedDate;

  @JsonKey(name: 'next_published_date')
  @HiveField(4)
  String? nextPublishedDate;

  @JsonKey(name: 'lists')
  @HiveField(5)
  List<ListsVO>?lists;

  factory OverViewVO.fromJson(Map<String,dynamic>json)=>_$OverViewVOFromJson(json);

  Map<String,dynamic>toJson()=>_$OverViewVOToJson(this);
OverViewVO.normal();
  OverViewVO(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  @override
  String toString() {
    return 'OverViewVO{bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, publishedDateDescription: $publishedDateDescription, previousPublishedDate: $previousPublishedDate, nextPublishedDate: $nextPublishedDate, lists: $lists}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverViewVO &&
          runtimeType == other.runtimeType &&
          bestsellersDate == other.bestsellersDate &&
          publishedDate == other.publishedDate &&
          publishedDateDescription == other.publishedDateDescription &&
          previousPublishedDate == other.previousPublishedDate &&
          nextPublishedDate == other.nextPublishedDate &&
          listEquals(lists, other.lists);

  @override
  int get hashCode =>
      bestsellersDate.hashCode ^
      publishedDate.hashCode ^
      publishedDateDescription.hashCode ^
      previousPublishedDate.hashCode ^
      nextPublishedDate.hashCode ^
      lists.hashCode;
}