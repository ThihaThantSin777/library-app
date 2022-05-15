import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/bloc/search_temp_bloc.dart';
import 'package:library_app/resources/strings.dart';

import '../data.model/library_model_mock_data.dart';
import '../mock_data/library_mock_data.dart';

void main(){
  group('Search Bloc Test', (){
    SearchTempBloc ? searchTempBloc;

    setUp((){
      searchTempBloc=SearchTempBloc(LibraryModelMockData());
    });


    ///Pass
    test("Get Search Data",(){
      expect(searchTempBloc?.getRecentSearch,mockSearchTempVO());
    });


  });


}