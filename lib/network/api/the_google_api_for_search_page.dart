import 'package:dio/dio.dart';
import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:library_app/network/response/serach_response/search_response.dart';
import 'package:retrofit/http.dart';

part 'the_google_api_for_search_page.g.dart';

@RestApi(baseUrl: baseURLForSearchPage)
abstract class TheGoogleApiForSearchPage{
  factory TheGoogleApiForSearchPage(Dio dio) = _TheGoogleApiForSearchPage;

  @GET(searchEndPoint)
  Future<SearchResponse> getSearchResult(
      @Query(searchQueryParams) String key,
      );
}