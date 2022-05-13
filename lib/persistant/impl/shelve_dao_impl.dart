
import 'package:hive/hive.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/persistant/abstract/shelve_dao.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

class ShelveDaoImpl extends ShelveDao{
  @override
  Stream getShelvesEvent() =>_getShelveBox().watch();

  @override
  List<ShelveVO>? getShelvesList() {
    List<ShelveVO>?temp=_getShelveBox().values.toList();
    temp.sort((a,b){
      DateTime? dataTime1=a.dateTime;
      DateTime? dataTime2=b.dateTime;
      bool cond=dataTime1?.isAfter(dataTime2??DateTime.now())??false;
      return cond?1:-1;
    });
    return temp;
  }

  @override
  Stream<List<ShelveVO>?> getShelvesListStream() =>Stream.value(getShelvesList());

  @override
  void save(ShelveVO shelveVO) =>_getShelveBox().put(shelveVO.shelveName.toString(), shelveVO);

  Box<ShelveVO>_getShelveBox()=>Hive.box<ShelveVO>(boxNameForShelveVO);

  @override
  bool isShelveNameIsSave(String shelveName) {
    bool status=true;
  List<ShelveVO>temp=_getShelveBox().values.toList();
  if(temp.isNotEmpty){
    List<ShelveVO>? shelveVOList=temp.where((element) => element.shelveName.toString()==shelveName).toList();
    if(shelveVOList.isNotEmpty){
      status=false;
    }
  }
  return status;
  }

  @override
  ShelveVO? getShelvesVOByTitle(String title){
  //  _getShelveBox().values.toList().where((element) => element.shelveName.toString()==title).first;
    List<ShelveVO>temp=_getShelveBox().values.toList();
    temp.sort((a,b){
      DateTime? dataTime1=a.dateTime;
      DateTime? dataTime2=b.dateTime;
      bool cond=dataTime1?.isAfter(dataTime2??DateTime.now())??false;
      return cond?1:-1;
    });
    return temp.where((element) => element.shelveName.toString()==title).first;
  }

  @override
  void deleteShelve(String title)=>_getShelveBox().delete(title);

  @override
  List<String> getCategories(String title) {
    List<String>categories=[];
    List<ShelveVO>?temp=getShelvesList();
  temp?.forEach((element) {
   if(element.shelveName.toString()==title){
     element.detailsVO?.forEach((element2) {
       categories.add(element2.category.toString());
     });
   }
  });
  return categories.toSet().toList();
  }

  @override
  List<DetailsVO>? getDetailsListByCategories(List<String> categories) {
    List<DetailsVO>detailsVO=[];
    List<ShelveVO>?temp=getShelvesList();
    categories.forEach((element) {
      temp?.forEach((element2) {
      element2.detailsVO?.forEach((element3) {
        if(element3.category.toString()==element){
          detailsVO.add(element3);
        }
      });
      });
    });
    return detailsVO;
  }

}