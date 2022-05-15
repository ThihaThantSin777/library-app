import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';

import '../mock_data/library_mock_data.dart';

class LibraryModelMockData extends TheLibraryModel{
  @override
  void deleteShelf(String title) {

  }

  @override
  Map<String, String>? getBooksVO(String publishDate, String categoryName) =>{};

  @override
  List<String>? getCategories() =>mockCategories();

  @override
  List<String> getCategoriesByShelf(String title) =>mockCategories();

  @override
  Stream<List<DetailsVO>?> getDetailsFromDataBase() =>Stream.value(mockDetailsVOList());
  @override
  Future<DetailsVO?> getDetailsFromDatabaseByTitle(String title) =>Future.value(mockDetailsVOList().first);

  @override
  List<DetailsVO>? getDetailsList() =>mockDetailsVOList();

  @override
  List<DetailsVO>? getDetailsListByCategories(List<String> categories)=>mockDetailsVOList();

  @override
  List<DetailsVO>? getDetailsVOListForShelf(List<String> category) =>mockDetailsVOList();

  @override
  Stream<OverViewVO?> getOverViewBooksFromDataBase(String publishDate, String apiKey) =>Stream.value(mockOverViewVO());

  @override
  Future<OverViewVO?> getOverViewBooksFromNetWork(String publishDate, String apiKey) =>Future.value(mockOverViewVO());

  @override
  List<SearchTempVO>? getRecentSearch() =>mockSearchTempVO();

  @override
  Stream<List<SearchTempVO>?> getRecentSearchStream() =>Stream.value(mockSearchTempVO());

  @override
  Future<List<ItemsVO>?> getSearchResultFromNetWork(String key) =>Future.value(mockItemVoList());

  @override
  List<ShelveVO>? getShelvesList() =>mockShelveVOList();

  @override
  Stream<List<ShelveVO>?> getShelvesListStream() =>Stream.value(mockShelveVOList());

  @override
  ShelveVO? getShelvesVO(String title)=>mockShelveVOList().first;

  @override
  Stream<ViewMoreHiveVO?> getViewMoreFromDataBase(String apiKey, String categoryName, String offset)=>Stream.value(mockViewMoreForHive());

  @override
  Future<ViewMoreHiveVO?> getViewMoreFromNetWork(String apiKey, String categoryName, String offset) =>Future.value(mockViewMoreForHive());

  @override
  bool isShelfNameSave(String text) =>true;

  @override
  void saveDetails(DetailsVO detailsVO) {

  }

  @override
  void saveRecentSearch(String searchName) {

  }

  @override
  void saveShelves(ShelveVO shelveVO) {

  }

}