

import 'package:library_app/data/vos/search_vo/items_vo.dart';

class CategoryVO{
  String?categoryNames;

  List<ItemsVO>?categoryValue;

  CategoryVO(this.categoryNames, this.categoryValue);

  @override
  String toString() {
    return 'CategoryVO{categoryNames: $categoryNames, categoryValue: $categoryValue}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryVO &&
          runtimeType == other.runtimeType &&
          categoryNames == other.categoryNames &&
          categoryValue == other.categoryValue;

  @override
  int get hashCode => categoryNames.hashCode ^ categoryValue.hashCode;
}