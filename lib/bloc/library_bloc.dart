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
      notifyListeners();
    },
      onError: (error)=>print(error)
    );

    ChipVO chipVO1=ChipVO('Ebook',false,false);
    ChipVO chipVO2=ChipVO('Audio Book',false,false);
    ChipVO chipVO3=ChipVO('History',false,false);
    ChipVO chipVO4=ChipVO('Romance',false,false);
    ChipVO chipVO5=ChipVO('Computer',false,false);
    ChipVO chipVO6=ChipVO('Cook',false,false);
    ChipVO chipVO7=ChipVO('Health',false,false);

    _chips.add(chipVO1);
    _chips.add(chipVO2);
    _chips.add(chipVO3);
    _chips.add(chipVO4);
    _chips.add(chipVO5);
    _chips.add(chipVO6);
    _chips.add(chipVO7);

  }

  void clickChip(String name){
   List<ChipVO>temp= _chips.map((value){
      value.isOneSelect=true;
      if(value.chipName==name){
        value.isSelect=true;
      }else{
        value.isSelect=false;
      }
      return value;
    }).toList();
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
  notifyListeners();
}
  void presentText(String text){
    setPresentForm=text;
    notifyListeners();
  }

  void sortText(String text){
    setSortText=text;
    List<DetailsVO>?temp=getDetailsVO;
    if(text==sortByTitleText){
      temp?.sort((a,b){
        String title1=a.title??'';
        String title2=b.title??'';
        return title1.toLowerCase().compareTo(title2.toLowerCase());
      });
    }
    if(text==sortByAuthorText){
      temp?.sort((a,b){
        String title1=a.author??'';
        String title2=b.author??'';
        return title1.compareTo(title2);
      });
    }

    if(text==sortByRecentText){
      temp?.sort((a,b){
       DateTime title1=DateTime.parse(a.timeStamp??'');
       DateTime title2=DateTime.parse(b.timeStamp??'');
       return title1.isBefore(title2)?1:-1;
      });
    }
    List<DetailsVO>result=[];
    temp?.forEach((element) {
      result.add(element);
    });

    setDetailsVO=result;

    notifyListeners();
  }




}