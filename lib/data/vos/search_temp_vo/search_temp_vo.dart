

import 'package:hive/hive.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';

part 'search_temp_vo.g.dart';

@HiveType(typeId: hiveTypeSearchTemp)
class SearchTempVO{
  @HiveField(0)
  String ?id;


  @HiveField(2)
  String ?name;

  SearchTempVO(this.id, this.name);

  @override
  String toString() {
    return 'SearchTempVO{id: $id,  name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchTempVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode  ^ name.hashCode;
}