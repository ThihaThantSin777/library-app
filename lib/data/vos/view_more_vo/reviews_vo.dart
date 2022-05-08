
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'reviews_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeReview)
class ReviewsVO{

  @JsonKey(name: 'book_review_link')
  @HiveField(0)
  String? bookReviewLink;

  @JsonKey(name: 'first_chapter_link')
  @HiveField(1)
  String? firstChapterLink;

  @JsonKey(name: 'sunday_review_link')
  @HiveField(2)
  String? sundayReviewLink;

  @JsonKey(name: 'article_chapter_link')
  @HiveField(3)
  String? articleChapterLink;

  factory ReviewsVO.fromJson(Map<String,dynamic>json)=>_$ReviewsVOFromJson(json);

  Map<String,dynamic>toJson()=>_$ReviewsVOToJson(this);

  ReviewsVO(this.bookReviewLink, this.firstChapterLink, this.sundayReviewLink,
      this.articleChapterLink);

  @override
  String toString() {
    return 'ReviewsVO{bookReviewLink: $bookReviewLink, firstChapterLink: $firstChapterLink, sundayReviewLink: $sundayReviewLink, articleChapterLink: $articleChapterLink}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsVO &&
          runtimeType == other.runtimeType &&
          bookReviewLink == other.bookReviewLink &&
          firstChapterLink == other.firstChapterLink &&
          sundayReviewLink == other.sundayReviewLink &&
          articleChapterLink == other.articleChapterLink;

  @override
  int get hashCode =>
      bookReviewLink.hashCode ^
      firstChapterLink.hashCode ^
      sundayReviewLink.hashCode ^
      articleChapterLink.hashCode;
}