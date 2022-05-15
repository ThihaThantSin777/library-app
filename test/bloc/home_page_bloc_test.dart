import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/home_page_bloc.dart';

import '../data.model/library_model_mock_data.dart';
import '../mock_data/library_mock_data.dart';

void main(){
  group('Home Bloc Test', (){
    HomePageBloc ? homePageBloc;

    setUp((){
      homePageBloc=HomePageBloc(LibraryModelMockData());
    });

    test("Get horizontal List book ",(){
      expect(homePageBloc?.getOverViewVO, mockOverViewVO());
    });

    ///Pass
    test("Get Carousal Slider List book ",(){
      expect(homePageBloc?.getDetailsBook, mockDetailsVOList());
    });

    ///Pass
    test("Move home page to library page",(){
      homePageBloc?.setCurrentIndex=1;
      expect(homePageBloc?.getCurrentIndex, 1);
    });

    ///Pass
    test("Show floating action button",(){
      homePageBloc?.setIsFloatingActionButtonShow=true;
      expect(homePageBloc?.getIsFloatingActionButtonShow, true);
    });
  });


}