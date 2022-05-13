
import 'package:hive/hive.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

import '../over_view_vo/over_view_vo.dart';

part 'shelve_vo.g.dart';
@HiveType(typeId: hiveTypeShelves)
class ShelveVO{

  @HiveField(0)
  String ? shelveName;

  @HiveField(1)
  List<DetailsVO>? detailsVO;

  @HiveField(2)
  DateTime ? dateTime;

  ShelveVO(this.shelveName, this.detailsVO, this.dateTime);
  ShelveVO.normal();
  @override
  String toString() {
    return 'ShelveVO{shelveName: $shelveName, overViewVO: $detailsVO, dateTime: $dateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelveVO &&
          runtimeType == other.runtimeType &&
          shelveName == other.shelveName &&
          detailsVO == other.detailsVO &&
          dateTime == other.dateTime;

  @override
  int get hashCode =>
      shelveName.hashCode ^ detailsVO.hashCode ^ dateTime.hashCode;
}