

import 'package:json_annotation/json_annotation.dart';
part 'panelization_summary_vo.g.dart';

@JsonSerializable()
class PanelizationSummaryVO{

  @JsonKey(name: 'containsEpubBubbles')
  bool?containsEpubBubbles;

  @JsonKey(name: 'containsImageBubbles')
  bool?containsImageBubbles;

  PanelizationSummaryVO(this.containsEpubBubbles, this.containsImageBubbles);

  factory PanelizationSummaryVO.fromJson(Map<String,dynamic>json)=>_$PanelizationSummaryVOFromJson(json);

  Map<String,dynamic>toJson()=>_$PanelizationSummaryVOToJson(this);

  @override
  String toString() {
    return 'PanelizationSummary{containsEpubBubbles: $containsEpubBubbles, containsImageBubbles: $containsImageBubbles}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PanelizationSummaryVO &&
          runtimeType == other.runtimeType &&
          containsEpubBubbles == other.containsEpubBubbles &&
          containsImageBubbles == other.containsImageBubbles;

  @override
  int get hashCode =>
      containsEpubBubbles.hashCode ^ containsImageBubbles.hashCode;
}