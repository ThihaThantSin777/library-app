import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';

class DetailsBloc extends ChangeNotifier {
  List<ItemsVO>? _similarBook;
  TheLibraryModel _theLibraryModel = TheLibraryModelImpl();
  DetailsVO? _detailsVO;

  List<ItemsVO>? get getSimilarBook => _similarBook;

  set setDetailsVO(DetailsVO detailsVO) {
    _detailsVO = detailsVO;
  }

  get getDetailsVO => _detailsVO;

  set setSimilarBook(List<ItemsVO> value) {
    _similarBook = value;
  }



  DetailsBloc(String title, [TheLibraryModel? theLibraryModel]) {
    if (theLibraryModel != null) {
      _theLibraryModel = theLibraryModel;
    }

    _theLibraryModel.getDetailsFromDatabaseByTitle(title).then((value) {
      setDetailsVO=value??DetailsVO.normal();
      _theLibraryModel
          .getSearchResultFromNetWork(value?.category ?? 'Action')
          .then((value) {
        setSimilarBook = value?.take(5).toList() ?? [];
      }).catchError((error) => print(error));
      notifyListeners();
    }).catchError((error)=>print(error));
  }
}
