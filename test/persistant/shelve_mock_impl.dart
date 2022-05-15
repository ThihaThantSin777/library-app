import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/persistant/abstract/shelve_dao.dart';

import '../mock_data/library_mock_data.dart';

class ShelveMockImpl extends ShelveDao{
  @override
  void deleteShelve(String title) {
    // TODO: implement deleteShelve
  }

  @override
  List<String> getCategories(String title)=>mockCategories();

  @override
  List<DetailsVO>? getDetailsListByCategories(List<String> categories)=>mockDetailsVOList();

  @override
  Stream getShelvesEvent() =>Stream.value(null);

  @override
  List<ShelveVO>? getShelvesList() =>mockShelveVOList();

  @override
  Stream<List<ShelveVO>?> getShelvesListStream() =>Stream.value(getShelvesList());

  @override
  ShelveVO? getShelvesVOByTitle(String title) =>mockShelveVOList().first;

  @override
  bool isShelveNameIsSave(String shelveName) =>false;

  @override
  void save(ShelveVO shelveVO) {

  }

}