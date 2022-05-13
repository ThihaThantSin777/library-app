import 'package:flutter/material.dart';

class MenuVO{
  Icon icon;
  String title;

  MenuVO(this.icon, this.title);

  @override
  String toString() {
    return 'MenuVO{icon: $icon, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuVO &&
          runtimeType == other.runtimeType &&
          icon == other.icon &&
          title == other.title;

  @override
  int get hashCode => icon.hashCode ^ title.hashCode;
}

List<MenuVO>menuList=[
  MenuVO(const Icon(Icons.remove_circle), 'Remove download'),
  MenuVO(const Icon(Icons.delete), 'Delete from library'),
  MenuVO(const Icon(Icons.add), 'Add to shelf'),
  MenuVO(const Icon(Icons.book), 'About this book'),
];

List<MenuVO>menuListShelf=[
  MenuVO(const Icon(Icons.remove_circle), 'Remove download'),
  MenuVO(const Icon(Icons.delete), 'Remove from shelf'),
  MenuVO(const Icon(Icons.book), 'About this book'),
];