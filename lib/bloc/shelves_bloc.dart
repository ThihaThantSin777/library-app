
import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/chip_vo/chip_vo.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/resources/strings.dart';

class ShelveBloc extends ChangeNotifier{
  List<ShelveVO>?_shelves;
  DetailsVO ? detailsVO;
  bool _isShow=false;
  ShelveVO ?_shelveVO;
  bool get getIsShow=>_isShow;
  bool _isEdit=false;
  List<ChipVO>_chips=[];
  List<DetailsVO>?_detailsVOList;

  set setDetailsVOList(List<DetailsVO>detailsVO)=>_detailsVOList=detailsVO;

  List<DetailsVO>? get getDetailsVOList=>_detailsVOList;

  set setChips(List<ChipVO>chips)=>_chips=chips;

  List<ChipVO> get getChips=>_chips;

  set setIsEdit(bool isEdit)=>_isEdit=isEdit;

  bool get getIsEdit=>_isEdit;

  set setShelves(List<ShelveVO> shelves)=>_shelves=shelves;

  List<ShelveVO>? get getShelves=>_shelves;

  TheLibraryModel _theLibraryModel=TheLibraryModelImpl();
  set setShelveVO(ShelveVO shelveVO)=>_shelveVO=shelveVO;
  
  ShelveVO ? get getShelveVO=>_shelveVO;

  set setIsShow(bool isShow){
    _isShow=isShow;

  }

  void getDataInShelvesVO(String title){

     ShelveVO? shelveVO= _theLibraryModel.getShelvesVO(title);
     setShelveVO=shelveVO??ShelveVO.normal();
     setDetailsVOList=shelveVO?.detailsVO??[];
     _chips=[];

     List<String>temp=_theLibraryModel.getCategoriesByShelf(title);
     if(temp.isNotEmpty){
       temp.forEach((element) {
         ChipVO chipVO=ChipVO(element, false, false);
         _chips.add(chipVO);
       });
     }

     notifyListeners();
  }
  List<DetailsVO>_sorting(String text,List<DetailsVO>temp){
    List<DetailsVO>result=[];

    if(text==sortByTitleText){
      temp.sort((a,b){
        String title1=a.title??'';
        String title2=b.title??'';
        return title1.toLowerCase().compareTo(title2.toLowerCase());
      });
    }
    if(text==sortByAuthorText){
      temp.sort((a,b){
        String title1=a.author??'';
        String title2=b.author??'';
        return title1.compareTo(title2);
      });
    }

    if(text==sortByRecentText){
      temp.sort((a,b){
        DateTime title1=DateTime.parse(a.timeStamp??'');
        DateTime title2=DateTime.parse(b.timeStamp??'');
        return title1.isBefore(title2)?1:-1;
      });
    }
    temp.forEach((element) {
      result.add(element);
    });
    return result;
  }

  void sortText(String text){
    List<DetailsVO>?temp=getDetailsVOList;
    List<DetailsVO>result= _sorting(text, temp??[]);
    setDetailsVOList=result;
    notifyListeners();
  }
  ShelveBloc([TheLibraryModelImpl ?theLibraryModelImpl]){
    if(theLibraryModelImpl!=null){
      _theLibraryModel=theLibraryModelImpl;
    }
    _theLibraryModel.getShelvesListStream().listen((event) {
      setShelves=event??[];
      notifyListeners();
    },
      onError: (error)=>print(error)
    );
  }
  void clickChip(String name,String title){

    List<ChipVO>temp= _chips.map((value){
      value.isOneSelect=true;
      if(value.chipName==name){
        value.isSelect=!value.isSelect;
      }
      return value;
    }).toList();

    List<ChipVO>isClose=temp.where((element) => !element.isSelect).toList();
    if(isClose.length==temp.length){
      close(title);
    }else{
      List<String>categories=temp.where((element) => element.isSelect).map((e) => e.chipName.toString()).toList();
      List<DetailsVO>?details=_theLibraryModel.getDetailsVOListForShelf(categories);
      setDetailsVOList= details??[];
    }
    temp.sort((a,b){

      if(b.isSelect) {
        return 1;
      }
      return -1;
    });
    _chips=temp;
    notifyListeners();
  }
  void close(String title){
    List<ChipVO>temp= _chips.map((value){
      value.isOneSelect=false;
      value.isSelect=false;
      return value;
    }).toList();
    // temp.sort((a,b){
    //
    //   if(b.isSelect) {
    //     return 1;
    //   }
    //   return -1;
    // });
    _chips=temp;
    ShelveVO? shelveVO= _theLibraryModel.getShelvesVO(title);
    setShelveVO=shelveVO??ShelveVO.normal();
    setDetailsVOList=shelveVO?.detailsVO??[];
    setDetailsVOList=  _theLibraryModel.getDetailsList()??[];
    notifyListeners();
  }
  void saveShelfVoInShelfDatabaseBookVO(String title,DetailsVO? detailsVO){
    if(detailsVO!=null){
      ShelveVO ? _shelveVO=_theLibraryModel.getShelvesVO(title);
      List<DetailsVO>?tamp=_shelveVO?.detailsVO;
      tamp?.add(detailsVO);
      _shelveVO?.detailsVO=tamp;
      saveShelve(_shelveVO??ShelveVO.normal());
    }
  }

  void saveShelve(ShelveVO shelveVO)=>
    _theLibraryModel.saveShelves(shelveVO);


  bool isSaveShelveName(String shelveName)=>_theLibraryModel.isShelfNameSave(shelveName);

  void deleteShelf(String title)=>_theLibraryModel.deleteShelf(title);
}