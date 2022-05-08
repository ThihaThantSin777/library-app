

import 'package:json_annotation/json_annotation.dart';

part 'list_price_and_retail_price_not_array_vo.g.dart';

@JsonSerializable()
class ListPriceAndRetailPriceNotArrayVO{

  @JsonKey(name: 'amount')
  double ?amount;

  @JsonKey(name: 'currencyCode')
  String? currencyCode;

  factory ListPriceAndRetailPriceNotArrayVO.fromJson(Map<String,dynamic>json)=>_$ListPriceAndRetailPriceNotArrayVOFromJson(json);

  Map<String,dynamic>toJson()=>_$ListPriceAndRetailPriceNotArrayVOToJson(this);

  ListPriceAndRetailPriceNotArrayVO(this.amount, this.currencyCode);

  @override
  String toString() {
    return 'ListPriceAndRetailPriceNotArrayVO{amount: $amount, currencyCode: $currencyCode}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListPriceAndRetailPriceNotArrayVO &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          currencyCode == other.currencyCode;

  @override
  int get hashCode => amount.hashCode ^ currencyCode.hashCode;
}