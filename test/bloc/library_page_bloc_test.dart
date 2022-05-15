import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/resources/strings.dart';

import '../data.model/library_model_mock_data.dart';
import '../mock_data/library_mock_data.dart';

void main(){
  group('Library Bloc Test', (){
    LibraryBloc ? libraryBloc;

    setUp((){
      libraryBloc=LibraryBloc(LibraryModelMockData());
    });


    ///Pass
    test("Get Library book from Database",(){
      expect(libraryBloc?.getDetailsVO,mockDetailsVOList());
    });

    ///Pass
    test("Get Chips",(){
      expect(libraryBloc?.getChips, mockChipVoList());
    });


    ///Pass
    test("Sort by test",(){
      libraryBloc?.sortText(sortByTitleText);
      expect(libraryBloc?.getSortText, sortByTitleText);
    });

    ///Pass
    test("Present Form by test",(){
      libraryBloc?.presentText(presentListText);
      expect(libraryBloc?.getPresentForm, presentListText);
    });
  });


}