
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/persistant/abstract/details_dao.dart';

import '../mock_data/library_mock_data.dart';

class DetailsMockImpl extends DetailsDAO{
  @override
  List<String>? getCategories() =>mockCategories();

  @override
  List<DetailsVO>? getDetailsBook() =>mockDetailsVOList();

  @override
  List<DetailsVO>? getDetailsBookByCategories(List<String> categories) =>mockDetailsVOList();

  @override
  DetailsVO? getDetailsBookByTitle(String title) =>mockDetailsVOList().first;

  @override
  Stream getDetailsBookEvent() =>Stream.value(null);

  @override
  Stream<List<DetailsVO>?> getDetailsBookStream() =>Stream.value(getDetailsBook());

  @override
  void save(DetailsVO detailsVO) {

  }
  
}