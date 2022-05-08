// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'the_google_api_for_search_page.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _TheGoogleApiForSearchPage implements TheGoogleApiForSearchPage {
  _TheGoogleApiForSearchPage(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SearchResponse> getSearchResult(key) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': key};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/books/v1/volumes',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
