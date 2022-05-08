

import 'package:json_annotation/json_annotation.dart';

part 'list_price_and_retail_price_vo.g.dart';

@JsonSerializable()
class ListPriceAndRetailPriceVO{

  @JsonKey(name: 'amountInMicros')
  int ? amountInMicros;

  @JsonKey(name:'currencyCode')
  String ? currencyCode;

  ListPriceAndRetailPriceVO(this.amountInMicros, this.currencyCode);

  factory ListPriceAndRetailPriceVO.fromJson(Map<String,dynamic>json)=>_$ListPriceAndRetailPriceVOFromJson(json);

  Map<String,dynamic>toJson()=>_$ListPriceAndRetailPriceVOToJson(this);

  @override
  String toString() {
    return 'ListPriceVO{amountInMicros: $amountInMicros, currencyCode: $currencyCode}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListPriceAndRetailPriceVO &&
          runtimeType == other.runtimeType &&
          amountInMicros == other.amountInMicros &&
          currencyCode == other.currencyCode;

  @override
  int get hashCode => amountInMicros.hashCode ^ currencyCode.hashCode;
}