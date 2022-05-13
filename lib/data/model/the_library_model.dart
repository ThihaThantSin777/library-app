import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';

abstract class TheLibraryModel{

  ///Overview
  Future<OverViewVO?> getOverViewBooksFromNetWork(String publishDate,String apiKey);
  Stream<OverViewVO?>getOverViewBooksFromDataBase(String publishDate,String apiKey);

  ///ViewMore
  Future<ViewMoreHiveVO?> getViewMoreFromNetWork(String apiKey,String categoryName,String offset);
  Stream<ViewMoreHiveVO?> getViewMoreFromDataBase(String apiKey,String categoryName,String offset);
  Map<String,String>?getBooksVO(String publishDate,String categoryName);
  ///Search
  Future<List<ItemsVO>?> getSearchResultFromNetWork(String key);

  ///Details
  Stream<List<DetailsVO>?>getDetailsFromDataBase();
  List<DetailsVO>?getDetailsList();
  void saveDetails(DetailsVO detailsVO);
  Future<DetailsVO?> getDetailsFromDatabaseByTitle(String title);
  List<String>?getCategories();
  List<DetailsVO>?getDetailsListByCategories(List<String>categories);

  ///Save and print Recent Search
  void saveRecentSearch(String searchName);
  List<SearchTempVO>?getRecentSearch();
  Stream<List<SearchTempVO>?>getRecentSearchStream();


  ///Shelves
  void saveShelves(ShelveVO shelveVO);
  List<ShelveVO>?getShelvesList();
  Stream<List<ShelveVO>?>getShelvesListStream();
  bool isShelfNameSave(String text);
  ShelveVO ? getShelvesVO(String title);
  void deleteShelf(String title);
  List<String>getCategoriesByShelf(String title);
  List<DetailsVO>?getDetailsVOListForShelf(List<String>category);

}