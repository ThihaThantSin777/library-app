import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/data/vos/chip_vo/chip_vo.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/home_session_view.dart';
import 'package:library_app/view_items/library_seesion_view.dart';
import 'package:provider/provider.dart';

class YourBookPage extends StatelessWidget {
  const YourBookPage(
      {Key? key, required this.detailsVO, required this.presentText})
      : super(key: key);
  final List<DetailsVO>? detailsVO;
  final String presentText;

  void navigateToDetailsView(DetailsVO detailsVO, context) {
   HomePageBloc homePageBloc=Provider.of(context,listen: false);
   homePageBloc.reSaveDetailsObject(detailsVO);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
          create:(context)=> DetailsBloc(detailsVO.title.toString()),
            child: const DetailsPage())));
  }

  Widget showBooks(String title, List<DetailsVO> detailsVO, context) {
    if (title == presentGridText) {
      return GridBookView(
        onTap: (detailsVO) {
          navigateToDetailsView(detailsVO, context);
        },
        detailsVO: detailsVO,
        isLargeGrid: false,
        height: gridHeight,
      );
    }
    if (title == presentLargeGridText) {
      return GridBookView(
        onTap: (detailsVO) {
          navigateToDetailsView(detailsVO, context);
        },
        detailsVO: detailsVO,
        isLargeGrid: true,
        height: largeGridHeight,
      );
    }
    return ListTileBooksView(
        detailsVO: detailsVO, onTap: (details) =>navigateToDetailsView(details, context));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryBloc>(
      create: (context)=>LibraryBloc(),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Selector<LibraryBloc,List<ChipVO>>(
              selector: (_,bloc)=>bloc.getChips,
              shouldRebuild: (pre,next)=>pre!=next,
              builder: (_,chips,child)=>
              Row(
                children: [
                  Visibility(
                    visible: chips[0].isOneSelect,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: padding10x, right: padding10x, top: padding10x),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius30x),
                              side: const BorderSide(
                                color: Colors.black54
                              )
                            ))
                          ),
                          onPressed: (){
                            LibraryBloc libraryBloc=Provider.of(_,listen: false);
                            libraryBloc.close();
                          },
                          child: const Icon(Icons.close),
                        ),
                      )
                  ),

                 Row(
                   children: chips.map((data) =>  GestureDetector(
                     onTap: (){
                       LibraryBloc libraryBloc=Provider.of(_,listen: false);
                       libraryBloc.clickChip(data.chipName);
                     },
                     child: Container(
                       alignment: Alignment.center,
                       margin: const EdgeInsets.only(
                           left: padding10x, right: padding10x, top: padding10x),
                       width: boxConstraintsForImageHeight,
                       height: chipHeight,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(borderRadius30x),
                         color: data.isSelect?Colors.indigo:Colors.white,
                         border: Border.all(color: data.isSelect?Colors.white:Colors.black54),
                       ),
                       child:  Text(data.chipName,style:  TextStyle(
                         color: data.isSelect?Colors.white:Colors.black54
                       ),),
                     ),
                   ),).toList(),
                 )
                ],
              ),
            ),
          ),
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
                              builder: (context) => PresentBottomSheetView(
                                  presentText: presentText));
                        },
                        icon: (presentText == presentListText)
                            ? const Icon(Icons.list)
                            : (presentText == presentGridText)
                                ? const Icon(Icons.apps)
                                : const Icon(Icons.drag_indicator))
                  ],
                ),
                showBooks(presentText, detailsVO ?? [], context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
