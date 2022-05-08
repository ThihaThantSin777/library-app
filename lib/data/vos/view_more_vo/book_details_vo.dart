
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'book_details_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeBookDetails)

class BookDetailsVO{

  @JsonKey(name: 'title')
  @HiveField(0)
  String?title;

  @JsonKey(name: 'description')
  @HiveField(1)
  String?description;

  @JsonKey(name: 'contributor')
  @HiveField(2)
  String?contributor;

  @JsonKey(name: 'author')
  @HiveField(3)
  String?author;

  @JsonKey(name: 'contributor_note')
  @HiveField(4)
  String?contributorNote;

  @JsonKey(name: 'price')
  @HiveField(5)
  String?price;

  @JsonKey(name: 'age_group')
  @HiveField(6)
  String?ageGroup;

  @JsonKey(name: 'publisher')
  @HiveField(7)
  String?publisher;

  @JsonKey(name: 'primary_isbn13')
  @HiveField(8)
  String?primaryIsbn13;

  @JsonKey(name: 'primary_isbn10')
  @HiveField(9)
  String?primaryIsbn10;


  factory BookDetailsVO.fromJson(Map<String,dynamic>json)=>_$BookDetailsVOFromJson(json);

  Map<String,dynamic>toJson()=>_$BookDetailsVOToJson(this);


  BookDetailsVO(
      this.title,
      this.description,
      this.contributor,
      this.author,
      this.contributorNote,
      this.price,
      this.ageGroup,
      this.publisher,
      this.primaryIsbn13,
      this.primaryIsbn10);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDetailsVO &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          contributor == other.contributor &&
          author == other.author &&
          contributorNote == other.contributorNote &&
          price == other.price &&
          ageGroup == other.ageGroup &&
          publisher == other.publisher &&
          primaryIsbn13 == other.primaryIsbn13 &&
          primaryIsbn10 == other.primaryIsbn10;

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      contributor.hashCode ^
      author.hashCode ^
      contributorNote.hashCode ^
      price.hashCode ^
      ageGroup.hashCode ^
      publisher.hashCode ^
      primaryIsbn13.hashCode ^
      primaryIsbn10.hashCode;

  @override
  String toString() {
    return 'BookDetails{title: $title, description: $description, contributor: $contributor, author: $author, contributorNote: $contributorNote, price: $price, ageGroup: $ageGroup, publisher: $publisher, primaryIsbn13: $primaryIsbn13, primaryIsbn10: $primaryIsbn10}';
  }
}