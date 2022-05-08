
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/view_more_vo/book_details_vo.dart';
import 'package:library_app/data/vos/view_more_vo/isbns_vo.dart';
import 'package:library_app/data/vos/view_more_vo/reviews_vo.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'view_more_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeViewMore)
class ViewMoreVO{

  @JsonKey(name: 'list_name')
  @HiveField(0)
  String?listName;

  @JsonKey(name: 'display_name')
  @HiveField(1)
  String?displayName;

  @JsonKey(name: 'bestsellers_date')
  @HiveField(2)
  String?bestsellersDate;

  @JsonKey(name: 'published_date')
  @HiveField(3)
  String?publishedDate;

  @JsonKey(name: 'rank')
  @HiveField(4)
  int?rank;

  @JsonKey(name: 'rank_last_week')
  @HiveField(5)
  int?rankLastWeek;

  @JsonKey(name: 'weeks_on_list')
  @HiveField(6)
  int?weeksOnList;

  @JsonKey(name: 'asterisk')
  @HiveField(7)
  int?asterisk;

  @JsonKey(name: 'dagger')
  @HiveField(8)
  int?dagger;

  @JsonKey(name: 'amazon_product_url')
  @HiveField(9)
  String?amazonProductUrl;


  @JsonKey(name: 'isbns')
  @HiveField(10)
  List<IsbnsVO>?isbns;

  @JsonKey(name: 'book_details')
  @HiveField(11)
  List<BookDetailsVO>?bookDetails;

  @JsonKey(name: 'reviews')
  @HiveField(12)
  List<ReviewsVO>?reviews;

  @HiveField(13)
  String?imageURL;
  ViewMoreVO.normal();
  ViewMoreVO(
      this.listName,
      this.displayName,
      this.bestsellersDate,
      this.publishedDate,
      this.rank,
      this.rankLastWeek,
      this.weeksOnList,
      this.asterisk,
      this.dagger,
      this.amazonProductUrl,
      this.isbns,
      this.bookDetails,
      this.reviews,
      this.imageURL
      );


  factory ViewMoreVO.fromJson(Map<String,dynamic>json)=>_$ViewMoreVOFromJson(json);

  Map<String,dynamic>toJson()=>_$ViewMoreVOToJson(this);

  @override
  String toString() {
    return 'ViewMoreVO{listName: $listName, displayName: $displayName, bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, rank: $rank, rankLastWeek: $rankLastWeek, weeksOnList: $weeksOnList, asterisk: $asterisk, dagger: $dagger, amazonProductUrl: $amazonProductUrl, isbns: $isbns, bookDetails: $bookDetails, reviews: $reviews, imageURL: $imageURL}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewMoreVO &&
          runtimeType == other.runtimeType &&
          listName == other.listName &&
          displayName == other.displayName &&
          bestsellersDate == other.bestsellersDate &&
          publishedDate == other.publishedDate &&
          rank == other.rank &&
          rankLastWeek == other.rankLastWeek &&
          weeksOnList == other.weeksOnList &&
          asterisk == other.asterisk &&
          dagger == other.dagger &&
          amazonProductUrl == other.amazonProductUrl &&
          isbns == other.isbns &&
          bookDetails == other.bookDetails &&
          reviews == other.reviews &&
          imageURL == other.imageURL;

  @override
  int get hashCode =>
      listName.hashCode ^
      displayName.hashCode ^
      bestsellersDate.hashCode ^
      publishedDate.hashCode ^
      rank.hashCode ^
      rankLastWeek.hashCode ^
      weeksOnList.hashCode ^
      asterisk.hashCode ^
      dagger.hashCode ^
      amazonProductUrl.hashCode ^
      isbns.hashCode ^
      bookDetails.hashCode ^
      reviews.hashCode ^
      imageURL.hashCode;
}