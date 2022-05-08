import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';

abstract class TheLibraryDataAgent{
  Future<OverViewVO?> getOverViewBooks(String publishDate,String apiKey);

  Future<ViewMoreHiveVO?>getViewMoreBooks(String apiKey,String categoryName,String offset);

  Future<List<ItemsVO>?>getSearchResult(String key);
}