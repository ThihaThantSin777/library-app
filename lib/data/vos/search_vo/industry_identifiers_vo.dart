
import 'package:json_annotation/json_annotation.dart';

part 'industry_identifiers_vo.g.dart';

@JsonSerializable()
class IndustryIdentifiersVO{

  @JsonKey(name: 'type')
  String?type;

  @JsonKey(name: 'identifier')
  String?identifier;

  factory IndustryIdentifiersVO.fromJson(Map<String,dynamic>json)=>_$IndustryIdentifiersVOFromJson(json);

  Map<String,dynamic>toJson()=>_$IndustryIdentifiersVOToJson(this);

  IndustryIdentifiersVO(this.type, this.identifier);

  @override
  String toString() {
    return 'IndustryIdentifiersVO{type: $type, identifier: $identifier}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndustryIdentifiersVO &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          identifier == other.identifier;

  @override
  int get hashCode => type.hashCode ^ identifier.hashCode;
}