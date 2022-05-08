

import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';

abstract class ViewMoreDAO{
  void save(String categoryName,ViewMoreHiveVO viewMoreListVO);

  ViewMoreHiveVO? getViewMoreListVO(String categoryName);

  Stream<ViewMoreHiveVO?>getViewMoreListVOStream(String categoryName);

  Stream getViewMoreListVOStreamEvent();
}