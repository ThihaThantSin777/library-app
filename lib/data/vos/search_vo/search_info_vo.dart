
import 'package:json_annotation/json_annotation.dart';

part 'search_info_vo.g.dart';

@JsonSerializable()
class SearchInfoVO{

  @JsonKey(name: 'textSnippet')
  String?textSnippet;


  SearchInfoVO(this.textSnippet);

  factory SearchInfoVO.fromJson(Map<String,dynamic>json)=>_$SearchInfoVOFromJson(json);

  Map<String,dynamic>toJson()=>_$SearchInfoVOToJson(this);

  @override
  String toString() {
    return 'SearchInfoVO{textSnippet: $textSnippet}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInfoVO &&
          runtimeType == other.runtimeType &&
          textSnippet == other.textSnippet;

  @override
  int get hashCode => textSnippet.hashCode;
}