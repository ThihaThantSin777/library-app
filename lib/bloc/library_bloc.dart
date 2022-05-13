import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/chip_vo/chip_vo.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/resources/strings.dart';

class LibraryBloc extends ChangeNotifier{
  List<DetailsVO>?_detailsVO;
  String _sortText=sortByRecentText;
  String _presentForm=presentGridText;
  TheLibraryModel _theLibraryModel = TheLibraryModelImpl();
  List<ChipVO>_chips=[];

  set setChips(List<ChipVO>chips)=>_chips=chips;

  List<ChipVO>get getChips=>_chips;
  set setDetailsVO(List<DetailsVO>detailsVO)=>_detailsVO=detailsVO;

  List<DetailsVO>? get getDetailsVO=>_detailsVO;

  set setSortText(String sortText)=>_sortText=sortText;

  String  get getSortText=>_sortText;

  set setPresentForm(String presentForm)=>_presentForm=presentForm;

  String  get getPresentForm=>_presentForm;

  LibraryBloc([TheLibraryModel ?theLibraryModel]){
    if(theLibraryModel!=null){
      _theLibraryModel=theLibraryModel;
    }
    _theLibraryModel.getDetailsFromDataBase().listen((event) {
      _detailsVO=event;
      _chips=[];
      List<String>?temp=_theLibraryModel.getCategories();
      if(temp?.isNotEmpty??false){
        temp?.forEach((element) {
          ChipVO chipVO=ChipVO(element, false, false);
          _chips.add(chipVO);
        });
      }
      notifyListeners();
    },
      onError: (error)=>print(error)
    );




  }

  void clickChip(String name){

   List<ChipVO>temp= _chips.map((value){
      value.isOneSelect=true;
      if(value.chipName==name){
        value.isSelect=!value.isSelect;
      }
      return value;
    }).toList();

   List<ChipVO>isClose=temp.where((element) => !element.isSelect).toList();
   if(isClose.length==temp.length){
     close();
   }else{
     List<String>categories=temp.where((element) => element.isSelect).map((e) => e.chipName.toString()).toList();
     List<DetailsVO>?details=_theLibraryModel.getDetailsListByCategories(categories);
     setDetailsVO=_sorting(getPresentForm, details??[]);
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
void close(){
  List<ChipVO>temp= _chips.map((value){
    value.isOneSelect=false;
    value.isSelect=false;
    return value;
  }).toList();
  _chips=temp;
  temp.sort((a,b){

    if(b.isSelect) {
      return 1;
    }
    return -1;
  });
  setDetailsVO=_sorting(getPresentForm, _theLibraryModel.getDetailsList()??[]);
  notifyListeners();
}
  void presentText(String text){
    setPresentForm=text;
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
    setSortText=text;
    List<DetailsVO>?temp=getDetailsVO;
    List<DetailsVO>result= _sorting(text, temp??[]);
    setDetailsVO=result;
    notifyListeners();
  }




}