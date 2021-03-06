import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/lists_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/category_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/data/vos/search_vo/images_link_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import "package:collection/collection.dart";

class SearchTempBloc extends ChangeNotifier {
  TheLibraryModel _theLibraryModel = TheLibraryModelImpl();
  OverViewVO? _searchResult;
  List<ItemsVO>?itemsSearch;
  List<SearchTempVO>? _recentSearch;
  bool _isEmpty = true;
  List<CategoryVO>? _categories;
  final imageURL='https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';

  set setCategory(List<CategoryVO> categories) => _categories = categories;

  get getCategory => _categories;

  set setIsEmpty(bool isEmpty) => _isEmpty = isEmpty;

  get getIsEmpty => _isEmpty;

  OverViewVO? get getSearchResult => _searchResult;

  set setSearchResult(OverViewVO value) {
    _searchResult = value;
  }

  List<SearchTempVO>? get getRecentSearch => _recentSearch;

  set setRecentSearch(List<SearchTempVO> value) {
    _recentSearch = value;
  }

  SearchTempBloc([TheLibraryModel? theLibraryModel]) {
    setIsEmpty=true;
    if (theLibraryModel != null) {
      _theLibraryModel = theLibraryModel;
    }
  //  setIsEmpty = true;
    _theLibraryModel.getRecentSearchStream().listen((recentSearch) {
      setRecentSearch = recentSearch ?? [];
      notifyListeners();
    }, onError: (error) => print(error));
  }

  void saveRecentSearch(String key,bool isSave) {
    if(isSave){
      _theLibraryModel.saveRecentSearch(key);
    }
    _theLibraryModel.getSearchResultFromNetWork(key).then((value) {
      itemsSearch=value;
      var newMap = groupBy(value!, (ItemsVO items) {
        return items.volumeInfo?.categories?.first;
      });
      List<CategoryVO> temp = [];
      newMap.forEach((keyC, valueC) {
      List<ItemsVO>items=valueC.map((e) {
        if(e.volumeInfo?.imageLinks==null){
          ImageLinksVO imageLinksVO=ImageLinksVO.normal();
          imageLinksVO.thumbnail=imageURL.toString();
          imageLinksVO.smallThumbnail=imageURL.toString();
          e.volumeInfo?.imageLinks=imageLinksVO;
        }
        return e;
      }).toList();
        CategoryVO categoryVO = CategoryVO(keyC, items);
        temp.add(categoryVO);
      });
      setCategory=temp;
      notifyListeners();
    }).catchError((error) => print(error));


  }
  void saveBookVOObjectInDetailsDatabase(BooksVO booksVO) {
    DetailsVO detailsVO = DetailsVO.normal();

    detailsVO.image = booksVO.bookImage.toString();
    detailsVO.title = booksVO.title.toString();
    detailsVO.bookType = 'E book';
    detailsVO.pages = 100;
    detailsVO.rating =(booksVO.rank??12).toDouble();
    detailsVO.reviewCount = booksVO.buyLinks?.length ?? 0;
    detailsVO.price = booksVO.price.toString() == '0.00'
        ? '640.23'
        : booksVO.price.toString();
    detailsVO.description = booksVO.description.toString();
    detailsVO.author = booksVO.author.toString();
    detailsVO.timeStamp = DateTime.now().toString();
    detailsVO.category = booksVO.firstChapterLink.toString();
    _theLibraryModel.saveDetails(detailsVO);
  }
  void saveItemVOObjectInDetailsDatabase(ItemsVO itemsVO,String categoryName) {
    DetailsVO detailsVO = DetailsVO.normal();
    detailsVO.image = itemsVO.volumeInfo?.imageLinks?.thumbnail.toString();
    detailsVO.title = itemsVO.volumeInfo?.title.toString();
    detailsVO.bookType =
    itemsVO.saleInfo?.isEbook ?? false ? 'Ebook' : 'AudioBook';
    detailsVO.pages = itemsVO.volumeInfo?.pageCount;
    detailsVO.rating = 4.5;
    detailsVO.reviewCount = 15;
    detailsVO.price = '640.32';
    detailsVO.description =
    'You should only submit an answer when you are proposing a solution to the poster\'s problem. If you want the poster to clarify the question or provide more information, please leave a comment instead';
    detailsVO.author = 'Mike Thomas';
    detailsVO.timeStamp = DateTime.now().toString();
    detailsVO.category = itemsVO.volumeInfo?.categories?.join(',')??categoryName;
    _theLibraryModel.saveDetails(detailsVO);
  }

  DetailsVO saveItemVOObjectInDetailsTypeDetailsVO(ItemsVO itemsVO) {
    DetailsVO detailsVO = DetailsVO.normal();
    detailsVO.image = itemsVO.volumeInfo?.imageLinks?.thumbnail.toString();
    detailsVO.title = itemsVO.volumeInfo?.title.toString();
    detailsVO.bookType =
    itemsVO.saleInfo?.isEbook ?? false ? 'Ebook' : 'AudioBook';
    detailsVO.pages = itemsVO.volumeInfo?.pageCount;
    detailsVO.rating = 4.5;
    detailsVO.reviewCount = 15;
    detailsVO.price = '640.32';
    detailsVO.description =
    'You should only submit an answer when you are proposing a solution to the poster\'s problem. If you want the poster to clarify the question or provide more information, please leave a comment instead';
    detailsVO.author = 'Mike Thomas';
    detailsVO.timeStamp = DateTime.now().toString();
    detailsVO.category = itemsVO.volumeInfo?.categories?.join(',');
    return detailsVO;
  }

  void searchFromNetwork(String key) {
    if (key.isNotEmpty) {
      _theLibraryModel.getSearchResultFromNetWork(key).then((value) {
        itemsSearch=value;
        if (value?.isEmpty ?? true) {
          setIsEmpty = true;
        } else {

          setSearchResult = _convertSerahcVOFromOverViewVO(value ?? []);
          setIsEmpty = false;
        }
        notifyListeners();
      }).catchError((error) => print(error));
    } else {
      setIsEmpty = true;
      notifyListeners();
    }
  }

    OverViewVO _convertSerahcVOFromOverViewVO(List<ItemsVO> itemsVO) {
      List<BooksVO> books = [];
      itemsVO.forEach((element) {
        BooksVO booksVO = BooksVO.normal();
        booksVO.title = element.volumeInfo?.title.toString();
        booksVO.bookImage =
            element.volumeInfo?.imageLinks?.thumbnail.toString();
        booksVO.contributor = (element.saleInfo?.isEbook.toString()) == 'true'
            ? 'Ebook'
            : 'Audio book';
        booksVO.bookImageWidth = element.volumeInfo?.pageCount;
        booksVO.rank = element.volumeInfo?.ratingsCount;
        booksVO.bookImageHeight = 50;
        booksVO.price = '200\$';
        booksVO.description = element.searchInfo?.textSnippet.toString();
        booksVO.author = element.volumeInfo?.author?.join(',');
        booksVO.firstChapterLink=element.volumeInfo?.categories?.join(',');
        books.add(booksVO);
      });
      ListsVO listsVO = ListsVO(
          0,
          'listName',
          'listNameEncoded',
          'displayName',
          'update',
          'listImage',
          100,
          100,
          books);
      OverViewVO overViewVO = OverViewVO.normal();
      overViewVO.lists = [listsVO];

      return overViewVO;
    }
  }

