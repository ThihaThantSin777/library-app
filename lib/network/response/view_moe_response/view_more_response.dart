

import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';

part 'view_more_response.g.dart';

@JsonSerializable()
class ViewMoreResponse{
  @JsonKey(name: 'status')
  String ?status;

  @JsonKey(name: 'copyright')
  String ?copyright;

  @JsonKey(name: 'num_results')
  int ?numResults;

  @JsonKey(name: 'last_modified')
  String ?lastModified;

  @JsonKey(name: 'results')
  List<ViewMoreVO> ?results;

  ViewMoreResponse(this.status, this.copyright, this.numResults,
      this.lastModified, this.results);

  factory ViewMoreResponse.fromJson(Map<String,dynamic>json)=>_$ViewMoreResponseFromJson(json);

  Map<String,dynamic>toJson()=>_$ViewMoreResponseToJson(this);

  @override
  String toString() {
    return 'ViewMoreResponse{status: $status, copyright: $copyright, numResults: $numResults, lastModified: $lastModified, results: $results}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewMoreResponse &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          copyright == other.copyright &&
          numResults == other.numResults &&
          lastModified == other.lastModified &&
          results == other.results;

  @override
  int get hashCode =>
      status.hashCode ^
      copyright.hashCode ^
      numResults.hashCode ^
      lastModified.hashCode ^
      results.hashCode;
}