// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'over_view_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverViewResponse _$OverViewResponseFromJson(Map<String, dynamic> json) =>
    OverViewResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['results'] == null
          ? null
          : OverViewVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OverViewResponseToJson(OverViewResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
