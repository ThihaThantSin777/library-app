import 'package:dio/dio.dart';
import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:library_app/network/response/view_moe_response/view_more_response.dart';
import 'package:retrofit/http.dart';

part 'the_library_api_for_view_more_page.g.dart';

@RestApi(baseUrl: baseURLForViewMorePage)
abstract class TheLibraryApiForViewMorePage{
  factory TheLibraryApiForViewMorePage(Dio dio) = _TheLibraryApiForViewMorePage;

  @GET(viewMorePageEndPoint)
  Future<ViewMoreResponse> getViewMoreResponse(
      @Query(apiKeyQueryParams) String apiKey,
      @Query(listQueryParams) String categoryName,
      @Query(offsetQueryParams) String offset,
      );
}