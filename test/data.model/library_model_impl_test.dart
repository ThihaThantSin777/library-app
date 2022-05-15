import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/data/vos/view_more_vo/book_details_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';

import '../mock_data/library_mock_data.dart';
import '../network/library_data_agent_impl_mock.dart';
import '../persistant/details_mock_impl.dart';
import '../persistant/over_view_mock_impl.dart';
import '../persistant/search_temp_mock_impl.dart';
import '../persistant/shelve_mock_impl.dart';
import '../persistant/view_more_mock_impl.dart';

void main() {
  group('Library App Test', () {
    var model = TheLibraryModelImpl();

    setUp(() {
      model.setDaoAndDataAgent(
          OverViewMockImpl(),
          ViewMoreMockImpl(),
          SearchTempMockImpl(),
          DetailsMockImpl(),
          LibraryDataAgentImplMock(),
          ShelveMockImpl());
    });

    test('OverView VO Test', (){
      expect(model.getOverViewBooksFromDataBase('publishDate', 'apiKey'),
         emits( mockOverViewVO())
      );
    });

    test('ViewMore VO Test', (){
      expect(model.getViewMoreFromDataBase('','publishDate', 'apiKey'),
         emits( ViewMoreHiveVO([
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
         ], 15))
      );
    });

    test('Shelve List Test', (){
      expect(model.getShelvesList(),

             [
               ShelveVO('shelveName1', mockDetailsVOList(), DateTime.now()),
               ShelveVO('shelveName2', mockDetailsVOList(), DateTime.now()),
               ShelveVO('shelveName3', mockDetailsVOList(), DateTime.now()),
             ]

      );
    });

    ///Pass
    test('DetailsList From Database Test', (){
      expect(model.getDetailsFromDataBase(), emits([
        DetailsVO('image', 'Superman', 'Cartoon', 100, 1, 1, '100', 'description',
            'author', 'timeStamp', 'Action'),
        DetailsVO('image', 'Ultra', 'Action', 100, 1, 1, '100', 'description',
            'author', 'timeStamp', 'Action'),
        DetailsVO('image', 'Bike Loops', 'Fantasy', 100, 1, 1, '100',
            'description', 'author', 'timeStamp', 'Romance'),
      ]));
    });

    ///Pass
    test('DetailsList by Shelf', (){
      expect(model.getDetailsVOListForShelf([]),mockDetailsVOList() );
    });

    test('ShelfList Stream', (){
      expect(model.getShelvesListStream(), emits(mockShelveVOList()));
    });

    test('Recent Search Stream', (){
      expect(model.getRecentSearchStream(), emits(mockSearchTempVO()));
    });
  });
}
