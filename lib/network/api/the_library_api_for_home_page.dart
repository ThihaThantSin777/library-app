import 'package:dio/dio.dart';
import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:library_app/network/response/over_view_response/over_view_response.dart';
import 'package:retrofit/http.dart';

part 'the_library_api_for_home_page.g.dart';

@RestApi(baseUrl: baseURLForHomePage)
abstract class TheLibraryApiForHomePage{
  factory TheLibraryApiForHomePage(Dio dio) = _TheLibraryApiForHomePage;

  @GET(homePageEndPoint)
  Future<OverViewResponse> getOverViewBooks(
      @Query(publishedDateQueryParams) String publishDate,
      @Query(apiKeyQueryParams) String apiKey,
      );


}