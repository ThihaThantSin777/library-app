
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_vo/list_price_and_retail_price_not_array_vo.dart';
import 'package:library_app/data/vos/search_vo/offers_vo.dart';

part 'saleinfo_vo.g.dart';

@JsonSerializable()
class SaleInfoVO{

  @JsonKey(name: 'country')
  String?country;

  @JsonKey(name: 'saleability')
  String?saleability;

  @JsonKey(name: 'isEbook')
  bool?isEbook;

  @JsonKey(name: 'listPrice')
  ListPriceAndRetailPriceNotArrayVO ?listPrice;

  @JsonKey(name: 'retailPrice')
  ListPriceAndRetailPriceNotArrayVO ?retailPrice;

  @JsonKey(name:'buyLink')
  String ?buyLink;

  @JsonKey(name: 'offers')
  List<OffersVO>?offers;

  SaleInfoVO(this.country, this.saleability, this.isEbook, this.listPrice,
      this.retailPrice, this.buyLink, this.offers);

  factory SaleInfoVO.fromJson(Map<String,dynamic>json)=>_$SaleInfoVOFromJson(json);

  Map<String,dynamic>toJson()=>_$SaleInfoVOToJson(this);

  @override
  String toString() {
    return 'SaleInfoVO{country: $country, saleability: $saleability, isEbook: $isEbook, listPrice: $listPrice, retailPrice: $retailPrice, buyLink: $buyLink, offers: $offers}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleInfoVO &&
          runtimeType == other.runtimeType &&
          country == other.country &&
          saleability == other.saleability &&
          isEbook == other.isEbook &&
          listPrice == other.listPrice &&
          retailPrice == other.retailPrice &&
          buyLink == other.buyLink &&
          offers == other.offers;

  @override
  int get hashCode =>
      country.hashCode ^
      saleability.hashCode ^
      isEbook.hashCode ^
      listPrice.hashCode ^
      retailPrice.hashCode ^
      buyLink.hashCode ^
      offers.hashCode;
}