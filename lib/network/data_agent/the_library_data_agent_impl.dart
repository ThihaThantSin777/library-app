import 'package:dio/dio.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/network/api/the_library_api_for_view_more_page.dart';
import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:library_app/network/data_agent/the_library_data_agent.dart';

import '../api/the_google_api_for_search_page.dart';
import '../api/the_library_api_for_home_page.dart';

class TheLibraryDataAgentImpl extends TheLibraryDataAgent{
  late TheLibraryApiForHomePage _theLibraryApiForHomePage;
  late TheLibraryApiForViewMorePage _theLibraryApiForViewMorePage;
  late TheGoogleApiForSearchPage _theGoogleApiForSearchPage;
  TheLibraryDataAgentImpl.normal(){
    final dio = Dio();
    dio.options = BaseOptions(
      headers:{
        headerAccept: applicationJson,
        headerContentType: applicationJson,
      },
    );
    _theLibraryApiForHomePage = TheLibraryApiForHomePage(dio);
    _theLibraryApiForViewMorePage=TheLibraryApiForViewMorePage(dio);
    _theGoogleApiForSearchPage=TheGoogleApiForSearchPage(dio);
  }

  static final TheLibraryDataAgentImpl _singleton=TheLibraryDataAgentImpl.normal();

  factory TheLibraryDataAgentImpl()=>_singleton;
  @override
  Future<OverViewVO?> getOverViewBooks(String publishDate, String apiKey) =>_theLibraryApiForHomePage.getOverViewBooks(publishDate, apiKey).asStream().map((event) => event.results).first;

  @override
  Future<ViewMoreHiveVO?> getViewMoreBooks(String apiKey, String categoryName,String offset) =>_theLibraryApiForViewMorePage.getViewMoreResponse(apiKey, categoryName,offset).asStream().map((event) {
    ViewMoreHiveVO viewMoreHiveVO=ViewMoreHiveVO(event.results, event.numResults);
    return viewMoreHiveVO;
  }).first;

  @override
  Future<List<ItemsVO>?> getSearchResult(String key) =>_theGoogleApiForSearchPage.getSearchResult(key).asStream().map((event) => event.items).first;

  
}