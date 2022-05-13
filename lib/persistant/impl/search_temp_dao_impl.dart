
import 'package:hive/hive.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/persistant/abstract/search_temp_dao.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';
import 'package:library_app/resources/strings.dart';

class SearchTempDAOImpl extends SearchTempDAO{

  @override
  List<SearchTempVO>? getSearchTempList() {
    SearchTempVO topSelling=SearchTempVO('0',  trendingText);
    SearchTempVO newReleases=SearchTempVO('0',  newReleasedText);
    SearchTempVO bookShop=SearchTempVO('0',  bookShopText);
    List<SearchTempVO>?searchResult=_getSearchTempBox().values
        .toList()
        .reversed
        .toList();
    searchResult.add(topSelling);
    searchResult.add(newReleases);
    searchResult.add(bookShop);
    return searchResult;

  }

    @override
    void save( String searchName) {
    SearchTempVO searchTempVO=SearchTempVO(DateTime.now().toString(),searchName);
    List<SearchTempVO>temp=_getSearchTempBox().values.toList().where((element) => element.name==searchName).toList();
    if(temp.isEmpty){
      _getSearchTempBox().put(DateTime.now().toString(), searchTempVO);
    }

    }

    @override
    Stream<List<SearchTempVO>?> getSearchTempEventList() =>Stream.value(getSearchTempList());

    @override
    Stream getSearchTempListEvent() =>_getSearchTempBox().watch();

    Box<SearchTempVO>_getSearchTempBox()=>Hive.box<SearchTempVO>(boxNameForSearchTempVO);
  }


