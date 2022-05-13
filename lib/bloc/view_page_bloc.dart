import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';
import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class ViewMorePageBloc extends ChangeNotifier {
  TheLibraryModel _theLibraryModel = TheLibraryModelImpl();
  List<ViewMoreVO>? _viewMoreVOList;
  int _offSet = 0;
  bool _isEmpty = false;
  int _numResult=0;

  set setIsEmpty(bool isEmpty) => _isEmpty = isEmpty;

  set setOffSet(int offSet) => _offSet = offSet;

  set setViewMoreVOList(List<ViewMoreVO> viewMoreVOList) =>
      _viewMoreVOList = viewMoreVOList;

  List<ViewMoreVO>? get getViewMoreList => _viewMoreVOList;

  int get getOffSet => _offSet;

  bool get getIsEmpty => _isEmpty;

  ViewMorePageBloc(String categoryName, [TheLibraryModel? theLibraryModel]) {
    if (theLibraryModel != null) {
      _theLibraryModel = theLibraryModel;
    }


    DateTime dateTime = DateTime.now();
    String monthFormat = (dateTime.month.toString().length) == 2
        ? dateTime.month.toString()
        : '0${dateTime.month.toString()}';
    String dayFormat = (dateTime.day.toString().length) == 2
        ? dateTime.day.toString()
        : '0${dateTime.day.toString()}';
    String publishDate = '${dateTime.year}-$monthFormat-$dayFormat';
    Map<String,String>?titleAndImage=_theLibraryModel.getBooksVO(publishDate, categoryName);


    _theLibraryModel
        .getViewMoreFromDataBase(apiKey, categoryName, '0')
        .listen((event) {
      _numResult=event?.numResult??0;

          List<ViewMoreVO>?temp=event?.listViewMoreVO;
      setViewMoreVOList = temp?.map((viewMoreVO) {
        viewMoreVO.imageURL=titleAndImage?[viewMoreVO.bookDetails?[0].title];
        return viewMoreVO;
      }).toList()??[];
      notifyListeners();
    });
  }
  void saveViewMoreVOObjectInDetailsDatabase(ViewMoreVO viewMoreVO, String category) {
    DetailsVO detailsVO = DetailsVO.normal();
    detailsVO.image =viewMoreVO.imageURL;
    detailsVO.title = viewMoreVO.bookDetails?[0].title.toString();
    detailsVO.bookType = 'E book';
    detailsVO.pages = 100;
    detailsVO.rating = viewMoreVO.rank?.toDouble();
    detailsVO.reviewCount = viewMoreVO.reviews?.length;
    detailsVO.price = viewMoreVO.bookDetails?[0].price.toString() == '0.00'
        ? '640.23'
        : viewMoreVO.bookDetails?[0].price.toString();
    detailsVO.description = viewMoreVO.bookDetails?[0].description.toString();
    detailsVO.author = viewMoreVO.bookDetails?[0].author.toString();
    detailsVO.timeStamp = DateTime.now().toString();
    detailsVO.category = category;
_theLibraryModel.saveDetails(detailsVO);
  }

  DetailsVO saveViewMoreVOObjectInDetailsTypeDetailsVO(ViewMoreVO viewMoreVO, String category) {
    DetailsVO detailsVO = DetailsVO.normal();
    detailsVO.image =viewMoreVO.imageURL;
    detailsVO.title = viewMoreVO.bookDetails?[0].title.toString();
    detailsVO.bookType = 'E book';
    detailsVO.pages = 100;
    detailsVO.rating = viewMoreVO.rank?.toDouble();
    detailsVO.reviewCount = viewMoreVO.reviews?.length;
    detailsVO.price = viewMoreVO.bookDetails?[0].price.toString() == '0.00'
        ? '640.23'
        : viewMoreVO.bookDetails?[0].price.toString();
    detailsVO.description = viewMoreVO.bookDetails?[0].description.toString();
    detailsVO.author = viewMoreVO.bookDetails?[0].author.toString();
    detailsVO.timeStamp = DateTime.now().toString();
    detailsVO.category = category;
   return detailsVO;
  }

  void scrollAndAddNewBooks(String categoryName) {
    if(_numResult>20 && getOffSet<_numResult){
      setOffSet = getOffSet + 20;
      _theLibraryModel.getViewMoreFromDataBase(apiKey, categoryName, getOffSet.toString()).listen((event) {
          setViewMoreVOList = event?.listViewMoreVO ?? [];
          setIsEmpty = false;
      });
    }else{
      setIsEmpty = true;
    }
  }


}
