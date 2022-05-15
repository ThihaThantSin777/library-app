import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/persistant/abstract/over_view_dao.dart';

import '../mock_data/library_mock_data.dart';

class OverViewMockImpl extends OverViewDAO{
  @override
  Map<String, String>? getBooksObject(String publishDate, String categoryName) {
    // TODO: implement getBooksObject
    throw UnimplementedError();
  }

  @override
  OverViewVO? getOverViewVO(String publishDate)=>mockOverViewVO();

  @override
  Stream<OverViewVO?> getOverViewVOStream(String publishDate) =>Stream.value(mockOverViewVO());

  @override
  Stream getOverViewVOStreamEvent() =>Stream.value(null);

  @override
  void save(String publishDate, OverViewVO overViewVO) {

  }

}