import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/persistant/abstract/view_more_dao.dart';

import '../mock_data/library_mock_data.dart';

class ViewMoreMockImpl extends ViewMoreDAO{
  @override
  ViewMoreHiveVO? getViewMoreListVO(String categoryName) =>mockViewMoreForHive();

  @override
  Stream<ViewMoreHiveVO?> getViewMoreListVOStream(String categoryName) =>Stream.value(getViewMoreListVO(categoryName));

  @override
  Stream getViewMoreListVOStreamEvent() =>Stream.value(null);

  @override
  void save(String categoryName, ViewMoreHiveVO viewMoreListVO) {

  }

}