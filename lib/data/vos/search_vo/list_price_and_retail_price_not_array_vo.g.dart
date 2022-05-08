// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_price_and_retail_price_not_array_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPriceAndRetailPriceNotArrayVO _$ListPriceAndRetailPriceNotArrayVOFromJson(
        Map<String, dynamic> json) =>
    ListPriceAndRetailPriceNotArrayVO(
      (json['amount'] as num?)?.toDouble(),
      json['currencyCode'] as String?,
    );

Map<String, dynamic> _$ListPriceAndRetailPriceNotArrayVOToJson(
        ListPriceAndRetailPriceNotArrayVO instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };
