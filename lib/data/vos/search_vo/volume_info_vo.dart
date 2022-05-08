

import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_vo/images_link_vo.dart';
import 'package:library_app/data/vos/search_vo/industry_identifiers_vo.dart';
import 'package:library_app/data/vos/search_vo/panelization_summary_vo.dart';
import 'package:library_app/data/vos/search_vo/reading_modes_vo.dart';
part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfoVO{
  @JsonKey(name: 'title')
  String?title;

  @JsonKey(name: 'author')
  List<String>?author;

  @JsonKey(name: 'publisher')
  String?publisher;

  @JsonKey(name: 'publishedDate')
  String?publishedDate;

  @JsonKey(name: 'description')
  String?description;

  @JsonKey(name: 'industryIdentifiers')
  List<IndustryIdentifiersVO>?industryIdentifiers;

  @JsonKey(name:'readingModes')
  ReadingModesVO ?readingModes;

  @JsonKey(name: 'pageCount')
  int ?pageCount;

  @JsonKey(name: 'printType')
  String?printType;

  @JsonKey(name: 'categories')
  List<String>?categories;

  @JsonKey(name: 'averageRating')
  double?averageRating;

  @JsonKey(name: 'ratingsCount')
  int? ratingsCount;

  @JsonKey(name: 'maturityRating')
  String?maturityRating;

  @JsonKey(name: 'allowAnonLogging')
  bool ?allowAnonLogging;

  @JsonKey(name: 'contentVersion')
  String?contentVersion;

  @JsonKey(name: 'panelizationSummary')
  PanelizationSummaryVO?panelizationSummary;

  @JsonKey(name: 'imageLinks')
  ImageLinksVO ?imageLinks;

  @JsonKey(name: 'languages')
  String?language;

  @JsonKey(name: 'previewLink')
  String ?previewLink;

  @JsonKey(name: 'infoLink')
  String?infoLink;

  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;

  VolumeInfoVO(
      this.title,
      this.author,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.categories,
      this.averageRating,
      this.ratingsCount,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink);

  factory VolumeInfoVO.fromJson(Map<String,dynamic>json)=>_$VolumeInfoVOFromJson(json);

  Map<String,dynamic>toJson()=>_$VolumeInfoVOToJson(this);

  @override
  String toString() {
    return 'VolumeInfoVO{title: $title, author: $author, publisher: $publisher, publishedDate: $publishedDate, description: $description, industryIdentifiers: $industryIdentifiers, readingModes: $readingModes, pageCount: $pageCount, printType: $printType, categories: $categories, averageRating: $averageRating, ratingsCount: $ratingsCount, maturityRating: $maturityRating, allowAnonLogging: $allowAnonLogging, contentVersion: $contentVersion, panelizationSummary: $panelizationSummary, imageLinks: $imageLinks, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoVO &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          publisher == other.publisher &&
          publishedDate == other.publishedDate &&
          description == other.description &&
          industryIdentifiers == other.industryIdentifiers &&
          readingModes == other.readingModes &&
          pageCount == other.pageCount &&
          printType == other.printType &&
          categories == other.categories &&
          averageRating == other.averageRating &&
          ratingsCount == other.ratingsCount &&
          maturityRating == other.maturityRating &&
          allowAnonLogging == other.allowAnonLogging &&
          contentVersion == other.contentVersion &&
          panelizationSummary == other.panelizationSummary &&
          imageLinks == other.imageLinks &&
          language == other.language &&
          previewLink == other.previewLink &&
          infoLink == other.infoLink &&
          canonicalVolumeLink == other.canonicalVolumeLink;

  @override
  int get hashCode =>
      title.hashCode ^
      author.hashCode ^
      publisher.hashCode ^
      publishedDate.hashCode ^
      description.hashCode ^
      industryIdentifiers.hashCode ^
      readingModes.hashCode ^
      pageCount.hashCode ^
      printType.hashCode ^
      categories.hashCode ^
      averageRating.hashCode ^
      ratingsCount.hashCode ^
      maturityRating.hashCode ^
      allowAnonLogging.hashCode ^
      contentVersion.hashCode ^
      panelizationSummary.hashCode ^
      imageLinks.hashCode ^
      language.hashCode ^
      previewLink.hashCode ^
      infoLink.hashCode ^
      canonicalVolumeLink.hashCode;
}
