import 'package:library_app/data/vos/details_vo/details_vo.dart';

abstract class DetailsDAO{
  void save(DetailsVO detailsVO);

  List<DetailsVO>?getDetailsBook();

  Stream getDetailsBookEvent();

  Stream<List<DetailsVO>?>getDetailsBookStream();

  DetailsVO ? getDetailsBookByTitle(String title);
}