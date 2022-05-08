

import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_vo/access_info_vo.dart';
import 'package:library_app/data/vos/search_vo/saleinfo_vo.dart';
import 'package:library_app/data/vos/search_vo/search_info_vo.dart';
import 'package:library_app/data/vos/search_vo/volume_info_vo.dart';

part 'items_vo.g.dart';

@JsonSerializable()
class ItemsVO{
  @JsonKey(name: 'kind')
  String?kind;

  @JsonKey(name: 'id')
  String?id;

  @JsonKey(name: 'etag')
  String ?etag;

  @JsonKey(name: 'selfLink')
  String ?selfLink;

  @JsonKey(name: 'volumeInfo')
  VolumeInfoVO? volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfoVO ?saleInfo;

  @JsonKey(name: 'accessInfo')
  AccessInfoVO?accessInfo;

  @JsonKey(name: 'searchInfo')
  SearchInfoVO? searchInfo;

  ItemsVO(this.kind, this.id, this.etag, this.selfLink, this.volumeInfo,
      this.saleInfo, this.accessInfo, this.searchInfo);

  factory ItemsVO.fromJson(Map<String,dynamic>json)=>_$ItemsVOFromJson(json);

  Map<String,dynamic>toJson()=>_$ItemsVOToJson(this);
  ItemsVO.normal();
  @override
  String toString() {
    return 'ItemsVO{kind: $kind, id: $id, etag: $etag, selfLink: $selfLink, volumeInfo: $volumeInfo, saleInfo: $saleInfo, accessInfo: $accessInfo, searchInfo: $searchInfo}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsVO &&
          runtimeType == other.runtimeType &&
          kind == other.kind &&
          id == other.id &&
          etag == other.etag &&
          selfLink == other.selfLink &&
          volumeInfo == other.volumeInfo &&
          saleInfo == other.saleInfo &&
          accessInfo == other.accessInfo &&
          searchInfo == other.searchInfo;

  @override
  int get hashCode =>
      kind.hashCode ^
      id.hashCode ^
      etag.hashCode ^
      selfLink.hashCode ^
      volumeInfo.hashCode ^
      saleInfo.hashCode ^
      accessInfo.hashCode ^
      searchInfo.hashCode;
}