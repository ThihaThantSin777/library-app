import 'package:flutter/material.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/view_items/home_session_view.dart';

class HorizontalListViewAndTitleWidget extends StatelessWidget {
  const HorizontalListViewAndTitleWidget({Key? key,required this.categoryName,this.hasViewMore=true,required this.onPressed,required this.itemBuilder,required this.itemCount}) : super(key: key);
  final String categoryName;
  final bool hasViewMore;
  final Function(String)onPressed;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: flexForHomePage1x,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding10x, vertical: padding10x),
                child: TitleAndRightIconView(
                  hasViewMore: hasViewMore,
                  categoryName: categoryName,
                  onPressed: (text)=>onPressed(text),
                )
            )
        ),
        Expanded(
            flex: flexForHomePage5x,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder:itemBuilder,
              separatorBuilder: (_, index) => const SizedBox(
                width: padding10x,
              ),
            )),
      ],
    );
  }
}
