
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/over_view_vo/buy_links_vo.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'books_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeBooks)



class BooksVO{
  @JsonKey(name: 'age_group')
  @HiveField(0)
  String ?ageGroup;

  @JsonKey(name: 'amazon_product_url')
  @HiveField(1)
  String ?amazonProductUrl;

  @JsonKey(name: 'article_chapter_link')
  @HiveField(2)
  String ?articleChapterLink;

  @JsonKey(name: 'author')
  @HiveField(3)
  String ?author;

  @JsonKey(name: 'book_image')
  @HiveField(4)
  String ?bookImage;

  @JsonKey(name: 'book_image_width')
  @HiveField(5)
  int ?bookImageWidth;

  @JsonKey(name: 'book_image_height')
  @HiveField(6)
  int ?bookImageHeight;

  @JsonKey(name: 'book_review_link')
  @HiveField(7)
  String ?bookReviewLink;

  @JsonKey(name: 'contributor')
  @HiveField(8)
  String ?contributor;

  @JsonKey(name: 'contributor_note')
  @HiveField(9)
  String ?contributorNote;

  @JsonKey(name: 'created_date')
  @HiveField(10)
  String ?createdDate;

  @JsonKey(name: 'description')
  @HiveField(11)
  String ?description;

  @JsonKey(name: 'first_chapter_link')
  @HiveField(12)
  String ?firstChapterLink;

  @JsonKey(name: 'price')
  @HiveField(13)
  String ?price;

  @JsonKey(name: 'primary_isbn10')
  @HiveField(14)
  String ?primaryIsbn10;

  @JsonKey(name: 'primary_isbn13')
  @HiveField(15)
  String ?primaryIsbn13;

  @JsonKey(name: 'book_uri')
  @HiveField(16)
  String ?bookUri;

  @JsonKey(name: 'publisher')
  @HiveField(17)
  String ?publisher;

  @JsonKey(name: 'rank')
  @HiveField(18)
  int ?rank;

  @JsonKey(name: 'rank_last_week')
  @HiveField(19)
  int ?rankLastWeek;

  @JsonKey(name: 'sunday_review_link')
  @HiveField(20)
  String ?sundayReviewLink;

  @JsonKey(name: 'title')
  @HiveField(21)
  String ?title;

  @JsonKey(name: 'updated_date')
  @HiveField(22)
  String ?updatedDate;

  @JsonKey(name: 'weeks_on_list')
  @HiveField(23)
  int ?weeksOnList;

  @JsonKey(name: 'buy_links')
  @HiveField(24)
  List<BuyLinksVO>?buyLinks;

  factory BooksVO.fromJson(Map<String,dynamic>json)=>_$BooksVOFromJson(json);

  Map<String,dynamic>toJson()=>_$BooksVOToJson(this);

  BooksVO(
      this.ageGroup,
      this.amazonProductUrl,
      this.articleChapterLink,
      this.author,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.bookReviewLink,
      this.contributor,
      this.contributorNote,
      this.createdDate,
      this.description,
      this.firstChapterLink,
      this.price,
      this.primaryIsbn10,
      this.primaryIsbn13,
      this.bookUri,
      this.publisher,
      this.rank,
      this.rankLastWeek,
      this.sundayReviewLink,
      this.title,
      this.updatedDate,
      this.weeksOnList,
      this.buyLinks);
BooksVO.normal();
  @override
  String toString() {
    return 'BooksVO{ageGroup: $ageGroup, amazonProductUrl: $amazonProductUrl, articleChapterLink: $articleChapterLink, author: $author, bookImage: $bookImage, bookImageWidth: $bookImageWidth, bookImageHeight: $bookImageHeight, bookReviewLink: $bookReviewLink, contributor: $contributor, contributorNote: $contributorNote, createdDate: $createdDate, description: $description, firstChapterLink: $firstChapterLink, price: $price, primaryIsbn10: $primaryIsbn10, primaryIsbn13: $primaryIsbn13, bookUri: $bookUri, publisher: $publisher, rank: $rank, rankLastWeek: $rankLastWeek, sundayReviewLink: $sundayReviewLink, title: $title, updatedDate: $updatedDate, weeksOnList: $weeksOnList, buyLinks: $buyLinks}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksVO &&
          runtimeType == other.runtimeType &&
          ageGroup == other.ageGroup &&
          amazonProductUrl == other.amazonProductUrl &&
          articleChapterLink == other.articleChapterLink &&
          author == other.author &&
          bookImage == other.bookImage &&
          bookImageWidth == other.bookImageWidth &&
          bookImageHeight == other.bookImageHeight &&
          bookReviewLink == other.bookReviewLink &&
          contributor == other.contributor &&
          contributorNote == other.contributorNote &&
          createdDate == other.createdDate &&
          description == other.description &&
          firstChapterLink == other.firstChapterLink &&
          price == other.price &&
          primaryIsbn10 == other.primaryIsbn10 &&
          primaryIsbn13 == other.primaryIsbn13 &&
          bookUri == other.bookUri &&
          publisher == other.publisher &&
          rank == other.rank &&
          rankLastWeek == other.rankLastWeek &&
          sundayReviewLink == other.sundayReviewLink &&
          title == other.title &&
          updatedDate == other.updatedDate &&
          weeksOnList == other.weeksOnList &&
          buyLinks == other.buyLinks;

  @override
  int get hashCode =>
      ageGroup.hashCode ^
      amazonProductUrl.hashCode ^
      articleChapterLink.hashCode ^
      author.hashCode ^
      bookImage.hashCode ^
      bookImageWidth.hashCode ^
      bookImageHeight.hashCode ^
      bookReviewLink.hashCode ^
      contributor.hashCode ^
      contributorNote.hashCode ^
      createdDate.hashCode ^
      description.hashCode ^
      firstChapterLink.hashCode ^
      price.hashCode ^
      primaryIsbn10.hashCode ^
      primaryIsbn13.hashCode ^
      bookUri.hashCode ^
      publisher.hashCode ^
      rank.hashCode ^
      rankLastWeek.hashCode ^
      sundayReviewLink.hashCode ^
      title.hashCode ^
      updatedDate.hashCode ^
      weeksOnList.hashCode ^
      buyLinks.hashCode;
}