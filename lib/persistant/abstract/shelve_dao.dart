import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';

abstract class ShelveDao{
  void save(ShelveVO shelveVO);

  List<ShelveVO>?getShelvesList();

  Stream<List<ShelveVO>?>getShelvesListStream();

  Stream getShelvesEvent();

  bool isShelveNameIsSave(String shelveName);

  ShelveVO ? getShelvesVOByTitle(String title);

  void deleteShelve(String title);

  List<String>getCategories(String title);

  List<DetailsVO>?getDetailsListByCategories(List<String>categories);
}