import 'package:hive/hive.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/persistant/abstract/details_dao.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

class DetailsDAOImpl extends DetailsDAO {
  @override
  List<DetailsVO>? getDetailsBook() {
    List<DetailsVO>? temp = _getDetailsBox().values.toList();
    temp.sort((a, b) {
      DateTime dateTime1 = DateTime.parse(a.timeStamp.toString());
      DateTime dateTime2 = DateTime.parse(b.timeStamp.toString());
      return dateTime1.isBefore(dateTime2) ? 1 : -1;
    });
    return temp;
  }

  @override
  Stream getDetailsBookEvent() => _getDetailsBox().watch();

  @override
  Stream<List<DetailsVO>?> getDetailsBookStream() =>
      Stream.value(getDetailsBook());

  @override
  void save(DetailsVO detailsVO) {
    _getDetailsBox().put(detailsVO.title, detailsVO);
  }

  Box<DetailsVO> _getDetailsBox() => Hive.box<DetailsVO>(boxNameForDetailsVO);

  @override
  DetailsVO? getDetailsBookByTitle(String title) => _getDetailsBox().get(title);

  @override
  List<String>? getCategories() => _getDetailsBox()
      .values
      .toList()
      .map((e) {
        return e.category.toString();
      })
      .toSet()
      .toList();

  @override
  List<DetailsVO>? getDetailsBookByCategories(List<String> categories) {
    List<DetailsVO> details = [];
    categories.forEach((categoryElement) {
      _getDetailsBox().values.toList().forEach((detailsElement) {
        if (detailsElement.category.toString() == categoryElement) {
          details.add(detailsElement);
        }
      });
    });
    return details;
  }
}
