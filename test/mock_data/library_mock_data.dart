import 'package:library_app/data/vos/chip_vo/chip_vo.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/lists_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/data/vos/search_vo/access_info_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/search_vo/saleinfo_vo.dart';
import 'package:library_app/data/vos/search_vo/volume_info_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/data/vos/view_more_vo/book_details_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';

List<String> mockCategories() => [
      'Action',
      'Drama',
      'Horror',
      'Romance',
    ];

List<ChipVO>mockChipVoList()=>[
  ChipVO('Action',false,false),
  ChipVO('Drama',false,false),
  ChipVO('Horror',false,false),
  ChipVO('Romance',false,false),
];

List<DetailsVO> mockDetailsVOList() => [
      DetailsVO('image', 'Superman', 'Cartoon', 100, 1, 1, '100', 'description',
          'author', 'timeStamp', 'Action'),
      DetailsVO('image', 'Ultra', 'Action', 100, 1, 1, '100', 'description',
          'author', 'timeStamp', 'Action'),
      DetailsVO('image', 'Bike Loops', 'Fantasy', 100, 1, 1, '100',
          'description', 'author', 'timeStamp', 'Romance'),
    ];

OverViewVO? mockOverViewVO() =>
    OverViewVO(
        'bestsellersDate',
        '2022-05-05',
        'publishedDateDescription',
        'previousPublishedDate',
        'nextPublishedDate', [
      ListsVO(123, 'Sweet', 'listNameEncoded', 'Sweet', '', '', 100, 100, [
        BooksVO(
            'ageGroup',
            'amazonProductUrl',
            'articleChapterLink',
            'Thiha',
            'bookImage',
            100,
            100,
            'bookReviewLink',
            'contributor',
            'contributorNote',
            '2022-05-05',
            'description',
            'firstChapterLink',
            '300',
            'primaryIsbn10',
            'primaryIsbn13',
            'bookUri',
            'publisher',
            1,
            2,
            'sundayReviewLink',
            'Sweet',
            'updatedDate',
            1, [])
      ])
    ]);

List<SearchTempVO> mockSearchTempVO() => [
      SearchTempVO('id1', 'name1'),
      SearchTempVO('id2', 'name2'),
      SearchTempVO('id3', 'name3'),
    ];

List<ShelveVO> mockShelveVOList() => [
      ShelveVO('shelveName1', mockDetailsVOList(), DateTime.now()),
      ShelveVO('shelveName2', mockDetailsVOList(), DateTime.now()),
      ShelveVO('shelveName3', mockDetailsVOList(), DateTime.now()),
    ];

ViewMoreHiveVO mockViewMoreForHive() =>
    ViewMoreHiveVO([
      ViewMoreVO(
          'listName',
          'displayName',
          'bestsellersDate',
          'publishedDate',
          1,
          1,
          1,
          1,
          1,
          'amazonProductUrl',
          [],
          [
            BookDetailsVO(
                'Avater',
                'description',
                'contributor',
                'AA',
                'contributorNote',
                '100',
                'ageGroup',
                'publisher',
                'primaryIsbn13',
                'primaryIsbn10')
          ],
          [],
          'imageURL'),
      ViewMoreVO(
          'listName',
          'displayName',
          'bestsellersDate',
          'publishedDate',
          1,
          1,
          1,
          1,
          1,
          'amazonProductUrl',
          [],
          [
            BookDetailsVO(
                'Naruto',
                'description',
                'contributor',
                'AA',
                'contributorNote',
                '100',
                'ageGroup',
                'publisher',
                'primaryIsbn13',
                'primaryIsbn10')
          ],
          [],
          'imageURL'),
      ViewMoreVO(
          'listName',
          'displayName',
          'bestsellersDate',
          'publishedDate',
          1,
          1,
          1,
          1,
          1,
          'amazonProductUrl',
          [],
          [
            BookDetailsVO(
                'Shinki',
                'description',
                'contributor',
                'AA',
                'contributorNote',
                '100',
                'ageGroup',
                'publisher',
                'primaryIsbn13',
                'primaryIsbn10')
          ],
          [],
          'imageURL')
    ], 15);


List<ItemsVO>mockItemVoList()=>[
          ItemsVO('kind', '123', 'etag', 'selfLink', VolumeInfoVO('Avater', ['author'], 'publisher', 'publishedDate', 'description', [], null, 100, 'printType', ['categories'], 100.0, 100, 'maturityRating', false, 'contentVersion', null, null, 'language', 'previewLink', 'infoLink', 'canonicalVolumeLink'), SaleInfoVO('country', 'saleability', null, null, null, '', []), AccessInfoVO('country', 'viewability', false, false, 'textToSpeechPermission', null, null, 'webReaderLink', 'accessViewStatus', true), null),
  ItemsVO('kind', '123', 'etag', 'selfLink', VolumeInfoVO('Sweet', ['author'], 'publisher', 'publishedDate', 'description', [], null, 100, 'printType', ['categories'], 100.0, 100, 'maturityRating', false, 'contentVersion', null, null, 'language', 'previewLink', 'infoLink', 'canonicalVolumeLink'), SaleInfoVO('country', 'saleability', null, null, null, '', []), AccessInfoVO('country', 'viewability', false, false, 'textToSpeechPermission', null, null, 'webReaderLink', 'accessViewStatus', true), null),
  ItemsVO('kind', '123', 'etag', 'selfLink', VolumeInfoVO('Naruto', ['author'], 'publisher', 'publishedDate', 'description', [], null, 100, 'printType', ['categories'], 100.0, 100, 'maturityRating', false, 'contentVersion', null, null, 'language', 'previewLink', 'infoLink', 'canonicalVolumeLink'), SaleInfoVO('country', 'saleability', null, null, null, '', []), AccessInfoVO('country', 'viewability', false, false, 'textToSpeechPermission', null, null, 'webReaderLink', 'accessViewStatus', true), null),
];
