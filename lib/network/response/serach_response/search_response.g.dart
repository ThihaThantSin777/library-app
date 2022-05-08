// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      json['kind'] as String?,
      json['totalItems'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => ItemsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
