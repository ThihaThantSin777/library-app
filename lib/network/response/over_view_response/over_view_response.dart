
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';

part 'over_view_response.g.dart';

@JsonSerializable()
class OverViewResponse{
  @JsonKey(name: 'status')
  String ?status;

  @JsonKey(name: 'copyright')
  String ?copyright;

  @JsonKey(name: 'num_results')
  int ?numResults;

  @JsonKey(name: 'results')
  OverViewVO? results;

  factory OverViewResponse.fromJson(Map<String,dynamic>json)=>_$OverViewResponseFromJson(json);

  Map<String,dynamic>toJson()=>_$OverViewResponseToJson(this);

  OverViewResponse(this.status, this.copyright, this.numResults, this.results);

  @override
  String toString() {
    return 'OverViewResponse{status: $status, copyright: $copyright, numResults: $numResults, results: $results}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverViewResponse &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          copyright == other.copyright &&
          numResults == other.numResults &&
          results == other.results;

  @override
  int get hashCode =>
      status.hashCode ^
      copyright.hashCode ^
      numResults.hashCode ^
      results.hashCode;
}