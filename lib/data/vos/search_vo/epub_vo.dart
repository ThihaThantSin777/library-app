
import 'package:json_annotation/json_annotation.dart';

part 'epub_vo.g.dart';

@JsonSerializable()
class EpubVO{

@JsonKey(name: 'isAvailable')
bool ?isAvailable;

@JsonKey(name: 'acsTokenLink')
String ?acsTokenLink;

EpubVO(this.isAvailable, this.acsTokenLink);

factory EpubVO.fromJson(Map<String,dynamic>json)=>_$EpubVOFromJson(json);


Map<String,dynamic>toJson()=>_$EpubVOToJson(this);

@override
  String toString() {
    return 'EpubVO{isAvailable: $isAvailable, acsTokenLink: $acsTokenLink}';


  }

@override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpubVO &&
          runtimeType == other.runtimeType &&
          isAvailable == other.isAvailable &&
          acsTokenLink == other.acsTokenLink;

  @override
  int get hashCode => isAvailable.hashCode ^ acsTokenLink.hashCode;
}