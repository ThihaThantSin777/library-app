// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_more_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewMoreResponse _$ViewMoreResponseFromJson(Map<String, dynamic> json) =>
    ViewMoreResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['last_modified'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => ViewMoreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewMoreResponseToJson(ViewMoreResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.results,
    };
