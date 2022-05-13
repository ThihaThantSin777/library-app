import 'package:flutter/material.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/home_session_view.dart';
import 'package:library_app/view_items/library_seesion_view.dart';
import 'package:provider/provider.dart';

class LibraryWidget extends StatelessWidget {
  const LibraryWidget({Key? key,required this.presentText,required this.widget, this.isShelf=false}) : super(key: key);
  final String presentText;
  final Widget widget;
  final bool isShelf;

  @override
  Widget build(BuildContext context) {
    return
      ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: padding10x, vertical: padding10x),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Selector<LibraryBloc, String>(
                    selector: (_, bloc) => bloc.getSortText,
                    builder: (_, sortText, child) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => SortBottomSheetView(
                              isShelf: isShelf,
                              sortText: sortText,
                            ));
                      },
                      child: SortByTextView(
                        text: sortText,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              print('Data $presentText');
                              return   PresentBottomSheetView(
                                  presentText: presentText);
                        });

                      },
                      icon: (presentText == presentListText)
                          ? const Icon(Icons.list)
                          : (presentText == presentGridText)
                          ? const Icon(Icons.apps)
                          : const Icon(Icons.drag_indicator))
                ],
              ),
            widget
            ],
          ),
        )
      ],
    );

  }

}
