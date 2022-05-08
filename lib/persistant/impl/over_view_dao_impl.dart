import 'package:hive/hive.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/persistant/abstract/over_view_dao.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

class OverViewDAOImpl extends OverViewDAO{
  OverViewDAOImpl.normal();
  static final OverViewDAOImpl _singleton=OverViewDAOImpl.normal();

  factory OverViewDAOImpl()=>_singleton;
  @override
  Stream getOverViewVOStreamEvent()=>_getOverViewHiveBox().watch();
  @override
  OverViewVO? getOverViewVO(String publishDate) =>_getOverViewHiveBox().get(publishDate);

  @override
  Stream<OverViewVO?> getOverViewVOStream(String publishDate) =>Stream.value(getOverViewVO(publishDate));

  @override
  void save(String publishDate, OverViewVO overViewVO) =>_getOverViewHiveBox().put(publishDate,overViewVO);

  Box<OverViewVO>_getOverViewHiveBox()=>Hive.box<OverViewVO>(boxNameForOverViewVO);

  @override
  Map<String,String>? getBooksObject(String publishDate,String categoryName) {
    List<BooksVO>?temp= getOverViewVO(publishDate)?.lists?.where((element) => element.listName.toString()==categoryName).map((e) => e.books).first;
    Map<String,String>result={
    };
    temp?.forEach((element) {
      result[element.title.toString()]=element.bookImage.toString();
    });
    return result;
  }

}