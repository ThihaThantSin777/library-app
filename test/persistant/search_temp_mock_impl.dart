import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/persistant/abstract/search_temp_dao.dart';

import '../mock_data/library_mock_data.dart';

class SearchTempMockImpl extends SearchTempDAO{
  @override
  Stream<List<SearchTempVO>?> getSearchTempEventList() =>Stream.value(getSearchTempList());

  @override
  List<SearchTempVO>? getSearchTempList() =>mockSearchTempVO();

  @override
  Stream getSearchTempListEvent() =>Stream.value(null);

  @override
  void save(String searchName) {

  }

}