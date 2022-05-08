import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';

abstract class OverViewDAO{
  void save(String publishDate,OverViewVO overViewVO);

  OverViewVO ? getOverViewVO(String publishDate);

  Stream<OverViewVO?>getOverViewVOStream(String publishDate);

  Stream getOverViewVOStreamEvent();

  Map<String,String>?getBooksObject(String publishDate,String categoryName);
}