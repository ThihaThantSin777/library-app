import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/network/api_constant/api_constant.dart';

class HomePageBloc extends ChangeNotifier{
  TheLibraryModel _theLibraryModel=TheLibraryModelImpl();
  OverViewVO ?_overViewVO;
  List<DetailsVO>?_detailsBook;
  int _currentIndex=0;
  bool _isFloatingActionButtonShow=false;


  set setIsFloatingActionButtonShow(bool isFloatingActionButtonShow){
    _isFloatingActionButtonShow=isFloatingActionButtonShow;
    notifyListeners();
  }

  bool get getIsFloatingActionButtonShow=>_isFloatingActionButtonShow;
  set setCurrentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }
    get getCurrentIndex=>_currentIndex;
    set setDetailsBooks(List<DetailsVO>detailsBook)=>_detailsBook=detailsBook;

    List<DetailsVO>?get getDetailsBook=>_detailsBook;

    set setOverViewVO(OverViewVO overViewVO)=>_overViewVO=overViewVO;

    OverViewVO? get getOverViewVO=>_overViewVO;



    HomePageBloc([TheLibraryModel? theLibraryModel]){
      if(theLibraryModel!=null){
        _theLibraryModel=theLibraryModel;
      }
      DateTime dateTime = DateTime.now();
      String monthFormat = (dateTime.month.toString().length) == 2
          ? dateTime.month.toString()
          : '0${dateTime.month.toString()}';
      String dayFormat = (dateTime.day.toString().length) == 2
          ? dateTime.day.toString()
          : '0${dateTime.day.toString()}';
      String publishDate = '${dateTime.year}-$monthFormat-$dayFormat';
      _theLibraryModel.getOverViewBooksFromDataBase(publishDate, apiKey).listen((value) {
        setOverViewVO=value??OverViewVO.normal();
        notifyListeners();
      },
          onError: (error)=>print(error)
      );

      _theLibraryModel.getDetailsFromDataBase().listen((event) {
        setDetailsBooks=event?.toList()??[];
        notifyListeners();
      },onError: (error)=>print(error)
      );
    }
  DetailsVO saveBookVOObjectInDetailsTypeDetailsVO(BooksVO booksVO, String category) {

    DetailsVO detailsVO = DetailsVO.normal();

    detailsVO.image = booksVO.bookImage.toString();
    detailsVO.title = booksVO.title.toString();
    detailsVO.bookType = 'E book';
    detailsVO.pages = 100;
    detailsVO.rating = double.parse(booksVO.rank.toString());
    detailsVO.reviewCount = booksVO.buyLinks?.length ?? 0;
    detailsVO.price = booksVO.price.toString() == '0.00'
        ? '640.23'
        : booksVO.price.toString();
    detailsVO.description = booksVO.description.toString();
    detailsVO.author = booksVO.author.toString();
    detailsVO.timeStamp = DateTime.now().toString();
    detailsVO.category = category;
    return detailsVO;
  }
  void reSaveDetailsObject(DetailsVO detailsVO) {
    detailsVO.timeStamp = DateTime.now().toString();
    _theLibraryModel.saveDetails(detailsVO);
  }
  void saveBookVOObjectInDetailsDatabase(BooksVO booksVO, String category) {
    DetailsVO detailsVO = DetailsVO.normal();

    detailsVO.image = booksVO.bookImage.toString();
    detailsVO.title = booksVO.title.toString();
    detailsVO.bookType = 'E book';
    detailsVO.pages = 100;
    detailsVO.rating = double.parse(booksVO.rank.toString());
    detailsVO.reviewCount = booksVO.buyLinks?.length ?? 0;
    detailsVO.price = booksVO.price.toString() == '0.00'
        ? '640.23'
        : booksVO.price.toString();
    detailsVO.description = booksVO.description.toString();
    detailsVO.author = booksVO.author.toString();
    detailsVO.timeStamp = DateTime.now().toString();
    detailsVO.category = category;
    _theLibraryModel.saveDetails(detailsVO);
  }

  }
