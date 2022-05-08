
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';

part 'search_response.g.dart';


@JsonSerializable()
class SearchResponse{
  @JsonKey(name: 'kind')
  String?kind;

  @JsonKey(name: 'totalItems')
  int?totalItems;

  @JsonKey(name: 'items')
  List<ItemsVO>?items;


  SearchResponse(this.kind, this.totalItems,this.items);

  factory SearchResponse.fromJson(Map<String,dynamic>json)=>_$SearchResponseFromJson(json);

  Map<String,dynamic>toJson()=>_$SearchResponseToJson(this);

  @override
  String toString() {
    return 'SearchResponse{kind: $kind, totalItems: $totalItems, items: $items}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchResponse &&
          runtimeType == other.runtimeType &&
          kind == other.kind &&
          totalItems == other.totalItems &&
          items == other.items;

  @override
  int get hashCode => kind.hashCode ^ totalItems.hashCode ^ items.hashCode;
}