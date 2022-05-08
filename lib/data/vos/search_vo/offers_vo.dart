

import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_vo/list_price_and_retail_price_vo.dart';

part 'offers_vo.g.dart';

@JsonSerializable()
class OffersVO{

  @JsonKey(name: 'finskyOfferType')
  int? finskyOfferType;

  @JsonKey(name: 'listPrice')
  ListPriceAndRetailPriceVO ?listPrice;

  @JsonKey(name: 'retailPrice')
  ListPriceAndRetailPriceVO ?retailPrice;

  factory OffersVO.fromJson(Map<String,dynamic>json)=>_$OffersVOFromJson(json);

  Map<String,dynamic>toJson()=>_$OffersVOToJson(this);

  OffersVO(this.finskyOfferType, this.listPrice, this.retailPrice);

  @override
  String toString() {
    return 'OffersVO{finskyOfferType: $finskyOfferType, listPrice: $listPrice, retailPrice: $retailPrice}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffersVO &&
          runtimeType == other.runtimeType &&
          finskyOfferType == other.finskyOfferType &&
          listPrice == other.listPrice &&
          retailPrice == other.retailPrice;

  @override
  int get hashCode =>
      finskyOfferType.hashCode ^ listPrice.hashCode ^ retailPrice.hashCode;
}