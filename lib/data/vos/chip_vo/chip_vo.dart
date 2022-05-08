class ChipVO{
  String chipName;
  bool isSelect;
  bool isOneSelect;

  ChipVO(this.chipName, this.isSelect,this.isOneSelect);

  @override
  String toString() {
    return 'ChipVO{chipName: $chipName, isSelect: $isSelect, isOneSelect: $isOneSelect}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChipVO &&
          runtimeType == other.runtimeType &&
          chipName == other.chipName &&
          isSelect == other.isSelect &&
          isOneSelect == other.isOneSelect;

  @override
  int get hashCode =>
      chipName.hashCode ^ isSelect.hashCode ^ isOneSelect.hashCode;
}

