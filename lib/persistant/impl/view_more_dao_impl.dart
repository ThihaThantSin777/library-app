import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/persistant/abstract/view_more_dao.dart';
import 'package:hive/hive.dart';

import '../hive_constant/hive_constant.dart';
class ViewMoreDAOImpl extends ViewMoreDAO{
  @override
  ViewMoreHiveVO? getViewMoreListVO(String categoryName) =>_getViewMoreListVOBox().get(categoryName);

  @override
  Stream<ViewMoreHiveVO?> getViewMoreListVOStream(String categoryName) =>Stream.value(getViewMoreListVO(categoryName));

  @override
  Stream getViewMoreListVOStreamEvent() =>_getViewMoreListVOBox().watch();

  @override
  void save(String categoryName, ViewMoreHiveVO viewMoreListVO) =>_getViewMoreListVOBox().put(categoryName,viewMoreListVO);

  Box<ViewMoreHiveVO>_getViewMoreListVOBox()=>Hive.box<ViewMoreHiveVO>(boxNameForViewMoreVO);

}