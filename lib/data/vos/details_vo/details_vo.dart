

import 'package:hive/hive.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'details_vo.g.dart';

@HiveType(typeId: hiveTypeDetails)
class DetailsVO{

  @HiveField(0)
  String?image;

  @HiveField(1)
  String ?title;

  @HiveField(2)
  String ?bookType;

  @HiveField(3)
  int ?pages;

  @HiveField(4)
  double ?rating;

  @HiveField(5)
  int ?reviewCount;

  @HiveField(6)
  String ?price;

  @HiveField(7)
  String ?description;

  @HiveField(8)
  String ?author;

  @HiveField(9)
  String ?timeStamp;

  @HiveField(10)
  String ?category;



  DetailsVO(
      this.image,
      this.title,
      this.bookType,
      this.pages,
      this.rating,
      this.reviewCount,
      this.price,
      this.description,
      this.author,
      this.timeStamp,
      this.category,);

  DetailsVO.normal();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsVO &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          title == other.title &&
          bookType == other.bookType &&
          pages == other.pages &&
          rating == other.rating &&
          reviewCount == other.reviewCount &&
          price == other.price &&
          description == other.description &&
          author == other.author &&
          timeStamp == other.timeStamp &&
          category == other.category ;

  @override
  int get hashCode =>
      image.hashCode ^
      title.hashCode ^
      bookType.hashCode ^
      pages.hashCode ^
      rating.hashCode ^
      reviewCount.hashCode ^
      price.hashCode ^
      description.hashCode ^
      author.hashCode ^
      timeStamp.hashCode ^
      category.hashCode ;

  @override
  String toString() {
    return 'DetailsVO{image: $image, title: $title, bookType: $bookType, pages: $pages, rating: $rating, reviewCount: $reviewCount, price: $price, description: $description, author: $author, timeStamp: $timeStamp, category: $category}';
  }
}