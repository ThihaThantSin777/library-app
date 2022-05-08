

import 'package:hive/hive.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'view_more_hive_vo.g.dart';

@HiveType(typeId: hiveTypeViewMoreHive)
class ViewMoreHiveVO{
  @HiveField(0)
  List<ViewMoreVO>?listViewMoreVO;

  @HiveField(1)
  int ?numResult;

  ViewMoreHiveVO(this.listViewMoreVO, this.numResult);
  ViewMoreHiveVO.normal();
  @override
  String toString() {
    return 'ViewMoreHiveVO{listViewMoreVO: $listViewMoreVO, numResult: $numResult}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewMoreHiveVO &&
          runtimeType == other.runtimeType &&
          listViewMoreVO == other.listViewMoreVO &&
          numResult == other.numResult;

  @override
  int get hashCode => listViewMoreVO.hashCode ^ numResult.hashCode;
}