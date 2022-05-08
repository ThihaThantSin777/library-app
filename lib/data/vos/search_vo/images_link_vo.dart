

import 'package:json_annotation/json_annotation.dart';

part 'images_link_vo.g.dart';

@JsonSerializable()
class ImageLinksVO{

  @JsonKey(name: 'smallThumbnail')
  String?smallThumbnail;

  @JsonKey(name: 'thumbnail')
  String ?thumbnail;

  ImageLinksVO(this.smallThumbnail, this.thumbnail);


  factory ImageLinksVO.fromJson(Map<String,dynamic>json)=>_$ImageLinksVOFromJson(json);

  Map<String,dynamic>toJson()=>_$ImageLinksVOToJson(this);

  @override
  String toString() {
    return 'ImageLinksVO{smallThumbnail: $smallThumbnail, thumbnail: $thumbnail}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksVO &&
          runtimeType == other.runtimeType &&
          smallThumbnail == other.smallThumbnail &&
          thumbnail == other.thumbnail;

  @override
  int get hashCode => smallThumbnail.hashCode ^ thumbnail.hashCode;
}