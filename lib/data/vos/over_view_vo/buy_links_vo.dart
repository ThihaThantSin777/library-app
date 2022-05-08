
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'buy_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeBuyLinks)
class BuyLinksVO{
  @JsonKey(name: 'name')
  @HiveField(0)
  String?name;

  @JsonKey(name: 'url')
  @HiveField(1)
  String ?url;

  BuyLinksVO(this.name, this.url);
  factory BuyLinksVO.fromJson(Map<String,dynamic>json)=>_$BuyLinksVOFromJson(json);

  Map<String,dynamic>toJson()=>_$BuyLinksVOToJson(this);
  @override
  String toString() {
    return 'BuyLinksVO{name: $name, url: $url}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyLinksVO &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          url == other.url;

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}