// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersVO _$OffersVOFromJson(Map<String, dynamic> json) => OffersVO(
      json['finskyOfferType'] as int?,
      json['listPrice'] == null
          ? null
          : ListPriceAndRetailPriceVO.fromJson(
              json['listPrice'] as Map<String, dynamic>),
      json['retailPrice'] == null
          ? null
          : ListPriceAndRetailPriceVO.fromJson(
              json['retailPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OffersVOToJson(OffersVO instance) => <String, dynamic>{
      'finskyOfferType': instance.finskyOfferType,
      'listPrice': instance.listPrice,
      'retailPrice': instance.retailPrice,
    };
