
import 'package:json_annotation/json_annotation.dart';

part 'pdf_vo.g.dart';

@JsonSerializable()
class PdfVO{

  @JsonKey(name: 'isAvailable')
  bool ?isAvailable;


  PdfVO(this.isAvailable);

  factory PdfVO.fromJson(Map<String,dynamic>json)=>_$PdfVOFromJson(json);

  Map<String,dynamic>toJson()=>_$PdfVOToJson(this);

  @override
  String toString() {
    return 'PdfVO{isAvailable: $isAvailable}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PdfVO &&
          runtimeType == other.runtimeType &&
          isAvailable == other.isAvailable;

  @override
  int get hashCode => isAvailable.hashCode;
}