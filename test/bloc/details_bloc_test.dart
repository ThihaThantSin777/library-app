import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/details_bloc.dart';

import '../data.model/library_model_mock_data.dart';
import '../mock_data/library_mock_data.dart';

void main(){
  group('Details Bloc Test', (){
      DetailsBloc ? detailsBloc;

      setUp((){
        detailsBloc=DetailsBloc('title',LibraryModelMockData());
      });

      test("Details Vo print by title",(){
        expect(detailsBloc?.getDetailsVO, mockDetailsVOList().first);
      });
  });
}