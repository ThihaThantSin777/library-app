

import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';

abstract class SearchTempDAO{
  void save(String searchName);

  List<SearchTempVO>? getSearchTempList();


  Stream getSearchTempListEvent();

  Stream<List<SearchTempVO>?>getSearchTempEventList();
}