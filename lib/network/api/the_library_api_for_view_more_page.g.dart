// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'the_library_api_for_view_more_page.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _TheLibraryApiForViewMorePage implements TheLibraryApiForViewMorePage {
  _TheLibraryApiForViewMorePage(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.nytimes.com/svc/books/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ViewMoreResponse> getViewMoreResponse(
      apiKey, categoryName, offset) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api-key': apiKey,
      r'list': categoryName,
      r'offset': offset
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ViewMoreResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/lists.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ViewMoreResponse.fromJson(_result.data!);
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
