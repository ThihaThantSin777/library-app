// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saleinfo_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfoVO _$SaleInfoVOFromJson(Map<String, dynamic> json) => SaleInfoVO(
      json['country'] as String?,
      json['saleability'] as String?,
      json['isEbook'] as bool?,
      json['listPrice'] == null
          ? null
          : ListPriceAndRetailPriceNotArrayVO.fromJson(
              json['listPrice'] as Map<String, dynamic>),
      json['retailPrice'] == null
          ? null
          : ListPriceAndRetailPriceNotArrayVO.fromJson(
              json['retailPrice'] as Map<String, dynamic>),
      json['buyLink'] as String?,
      (json['offers'] as List<dynamic>?)
          ?.map((e) => OffersVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleInfoVOToJson(SaleInfoVO instance) =>
    <String, dynamic>{
      'country': instance.country,
      'saleability': instance.saleability,
      'isEbook': instance.isEbook,
      'listPrice': instance.listPrice,
      'retailPrice': instance.retailPrice,
      'buyLink': instance.buyLink,
      'offers': instance.offers,
    };
