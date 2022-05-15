import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/network/data_agent/the_library_data_agent.dart';

import '../mock_data/library_mock_data.dart';

class LibraryDataAgentImplMock extends TheLibraryDataAgent{
  @override
  Future<OverViewVO?> getOverViewBooks(String publishDate, String apiKey) =>Future.value(mockOverViewVO());

  @override
  Future<List<ItemsVO>?> getSearchResult(String key) =>Future.value(mockItemVoList());

  @override
  Future<ViewMoreHiveVO?> getViewMoreBooks(String apiKey, String categoryName, String offset)=>Future.value(mockViewMoreForHive());
  
}