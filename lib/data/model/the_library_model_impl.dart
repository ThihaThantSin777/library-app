import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/network/data_agent/the_library_data_agent.dart';
import 'package:library_app/network/data_agent/the_library_data_agent_impl.dart';
import 'package:library_app/persistant/abstract/details_dao.dart';
import 'package:library_app/persistant/abstract/over_view_dao.dart';
import 'package:library_app/persistant/abstract/search_temp_dao.dart';
import 'package:library_app/persistant/abstract/shelve_dao.dart';
import 'package:library_app/persistant/abstract/view_more_dao.dart';
import 'package:library_app/persistant/impl/details_dao_impl.dart';
import 'package:library_app/persistant/impl/over_view_dao_impl.dart';
import 'package:library_app/persistant/impl/view_more_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../persistant/impl/search_temp_dao_impl.dart';
import '../../persistant/impl/shelve_dao_impl.dart';
import '../vos/view_more_vo/view_more_hive_vo.dart';

class TheLibraryModelImpl extends TheLibraryModel{
  TheLibraryModelImpl.normal();
  static final TheLibraryModelImpl _singleton=TheLibraryModelImpl.normal();
  factory TheLibraryModelImpl()=>_singleton;

  TheLibraryDataAgent _theLibraryDataAgentImpl=TheLibraryDataAgentImpl();
  OverViewDAO _overViewDAO=OverViewDAOImpl();
  ViewMoreDAO _viewMoreDAO=ViewMoreDAOImpl();
  SearchTempDAO _searchTempDAO=SearchTempDAOImpl();
  DetailsDAO _detailsDAO=DetailsDAOImpl();
  ShelveDao _shelveDao=ShelveDaoImpl();
  void setDaoAndDataAgent(OverViewDAO overViewDAOImpl,ViewMoreDAO viewMoreDAOImpl,SearchTempDAO searchTempDAOImpl,DetailsDAO detailsDAOImpl,TheLibraryDataAgent theLibraryDataAgentImpl,ShelveDao shelveDaoImpl){
    _overViewDAO=overViewDAOImpl;
    _viewMoreDAO=viewMoreDAOImpl;
    _searchTempDAO=searchTempDAOImpl;
    _detailsDAO=detailsDAOImpl;
    _shelveDao=shelveDaoImpl;
    _theLibraryDataAgentImpl=theLibraryDataAgentImpl;
  }

  @override
  Future<OverViewVO?> getOverViewBooksFromNetWork(String publishDate, String apiKey) =>
    _theLibraryDataAgentImpl.getOverViewBooks(publishDate, apiKey).then((value) {
    _overViewDAO.save(publishDate, value??OverViewVO.normal());
    return value;
   }).catchError((error)=>print(error));
  

  @override
  Stream<OverViewVO?> getOverViewBooksFromDataBase(String publishDate, String apiKey) {
   getOverViewBooksFromNetWork(publishDate, apiKey);
  return _overViewDAO.getOverViewVOStreamEvent().startWith(_overViewDAO.getOverViewVOStream(publishDate)).map((event) => _overViewDAO.getOverViewVO(publishDate));

  }

  @override
  Future<ViewMoreHiveVO?> getViewMoreFromNetWork(String apiKey, String categoryName,String offset) =>_theLibraryDataAgentImpl.getViewMoreBooks(apiKey, categoryName,offset).then((value) {
    _viewMoreDAO.save(categoryName, value??ViewMoreHiveVO.normal());
     return value;
  }).catchError((error)=>print(error));

  @override
  Stream<ViewMoreHiveVO?> getViewMoreFromDataBase(String apiKey, String categoryName, String offset) {
    getViewMoreFromNetWork(apiKey, categoryName, offset);
    return _viewMoreDAO.getViewMoreListVOStreamEvent().startWith(_viewMoreDAO.getViewMoreListVOStream(categoryName)).map((event) => _viewMoreDAO.getViewMoreListVO(categoryName));
  }

  @override
  Stream<List<SearchTempVO>?> getRecentSearchStream() =>_searchTempDAO.getSearchTempListEvent().startWith(_searchTempDAO.getSearchTempEventList()).map((event) => _searchTempDAO.getSearchTempList());

  @override
  void saveRecentSearch(String searchName) {
   _searchTempDAO.save( searchName);
  }

  @override
  Future<List<ItemsVO>?> getSearchResultFromNetWork(String key) =>_theLibraryDataAgentImpl.getSearchResult(key);

  @override
  List<SearchTempVO>? getRecentSearch()=>_searchTempDAO.getSearchTempList();

  @override
  Stream<List<DetailsVO>?> getDetailsFromDataBase() =>_detailsDAO.getDetailsBookEvent().startWith(_detailsDAO.getDetailsBookStream()).map((event) => _detailsDAO.getDetailsBook());

  @override
  void saveDetails( DetailsVO detailsVO) =>
      _detailsDAO.save(detailsVO);


  @override
  List<DetailsVO>? getDetailsList() =>_detailsDAO.getDetailsBook();

  @override
  Future<DetailsVO?> getDetailsFromDatabaseByTitle(String title) =>Future.value(_detailsDAO.getDetailsBookByTitle(title));

  @override
  Map<String,String>? getBooksVO(String publishDate, String categoryName) =>_overViewDAO.getBooksObject(publishDate, categoryName);

  @override
  List<String>? getCategories() =>_detailsDAO.getCategories();

  @override
  List<DetailsVO>? getDetailsListByCategories(List<String> categories) =>_detailsDAO.getDetailsBookByCategories(categories);

  @override
  List<ShelveVO>? getShelvesList()=>_shelveDao.getShelvesList();

  @override
  Stream<List<ShelveVO>?> getShelvesListStream() =>_shelveDao.getShelvesEvent().startWith(_shelveDao.getShelvesListStream()).map((event) => _shelveDao.getShelvesList());

  @override
  void saveShelves(ShelveVO shelveVO) =>_shelveDao.save(shelveVO);

  @override
  bool isShelfNameSave(String text) =>_shelveDao.isShelveNameIsSave(text);

  @override
  ShelveVO? getShelvesVO(String title) =>_shelveDao.getShelvesVOByTitle(title);

  @override
  void deleteShelf(String title) =>_shelveDao.deleteShelve(title);

  @override
  List<String> getCategoriesByShelf(String title) =>_shelveDao.getCategories(title);

  @override
  List<DetailsVO>? getDetailsVOListForShelf(List<String> category) =>_shelveDao.getDetailsListByCategories(category);
}