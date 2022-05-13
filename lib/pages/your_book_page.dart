import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/chip_vo/chip_vo.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/home_session_view.dart';
import 'package:library_app/view_items/library_seesion_view.dart';
import 'package:library_app/widget/empty_widget.dart';
import 'package:library_app/widget/library_widget.dart';
import 'package:library_app/widget/menu_widget.dart';
import 'package:provider/provider.dart';

class YourBookPage extends StatelessWidget {
  const YourBookPage(
      {Key? key, required this.detailsVO, required this.presentText,required this.scaffoldKey})
      : super(key: key);
  final List<DetailsVO>? detailsVO;
  final String presentText;
  final GlobalKey<ScaffoldState> scaffoldKey;

  void navigateToDetailsView(DetailsVO detailsVO, context) {
    HomePageBloc homePageBloc = Provider.of(context, listen: false);
    homePageBloc.reSaveDetailsObject(detailsVO);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
            create: (context) => DetailsBloc(detailsVO.title.toString()),
            child: const DetailsPage())));
  }

  void showMenu(context,DetailsVO detailsVO){
    showModalBottomSheet(context: context, builder: (context){
      return MenuWidget(
        onTap: ()=>navigateToAddToShelfScreen(context,detailsVO),
          imageURL: detailsVO.image.toString(), imageTitle: detailsVO.title.toString(), imageType: detailsVO.bookType.toString());
    });
  }

  void navigateToAddToShelfScreen(context,DetailsVO detailsVO){
    Navigator.of(context).pop();
    ShelveBloc shelveBloc=Provider.of(context,listen: false);
    shelveBloc.setIsShow = false;
    shelveBloc.setIsEdit=false;
    shelveBloc.detailsVO=detailsVO;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddToShelfPage())).then((value) {
      if(value){
        final snackBar = SnackBar(
          backgroundColor: Colors.blue,
          content: Text('${detailsVO.title.toString()} is added in the shelf'),
        );
        ScaffoldMessenger.of(scaffoldKey.currentContext??context).showSnackBar(snackBar);
      }
    });
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
        onPressed: (detailsVO){
          showMenu(context,detailsVO);
        },
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
        onPressed: (detailsVO){
          showMenu(context,detailsVO);
        },
      );
    }
    return ListTileBooksView(
        detailsVO: detailsVO,
        onTap: (details) => navigateToDetailsView(details, context),
      onPressed: (detailsVO){
        showMenu(context,detailsVO);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_){
      HomePageBloc homePageBloc=Provider.of(context,listen: false);
      homePageBloc.setIsFloatingActionButtonShow=false;
    });
    return detailsVO?.isEmpty??true?SizedBox(
        height: MediaQuery.of(context).size.height*0.5,
        child:  const EmptyWidget(text: 'No books are added in library',icon: Icon(Icons.sentiment_dissatisfied,color: Colors.black38,size: boxConstraintsForImageHeight,),)

    ):
    ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SingleChildScrollView(
          key: const Key('Chip Key'),
          scrollDirection: Axis.horizontal,
          child: Selector<LibraryBloc, List<ChipVO>>(
            selector: (_, bloc) => bloc.getChips,
            shouldRebuild: (pre, next) => pre != next,
            builder: (_, chips, child) => Row(
              children: [
                Visibility(
                    visible: chips[0].isOneSelect,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: padding10x, right: padding10x, top: padding10x),
                      child: TextButton(

                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(borderRadius30x),
                                    side: const BorderSide(
                                        color: Colors.black54)))),
                        onPressed: () {
                          LibraryBloc libraryBloc =
                          Provider.of(_, listen: false);
                          libraryBloc.close();
                        },
                        child: const Icon(Icons.close),
                      ),
                    )),
                Row(
                  children: chips
                      .map(
                        (data) => GestureDetector(
                      onTap: () {
                        LibraryBloc libraryBloc =
                        Provider.of(_, listen: false);
                        libraryBloc.clickChip(data.chipName);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: padding5x,vertical: padding5x),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                            left: padding10x,
                            right: padding10x,
                            top: padding10x),
                        height: chipHeight,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(borderRadius30x),
                          color: data.isSelect
                              ? const Color.fromRGBO(38, 83, 196, 1.0)
                              : Colors.white,
                          border: Border.all(
                              color: data.isSelect
                                  ? Colors.white
                                  : Colors.black54),
                        ),
                        child: Text(
                          data.chipName,
                          style: TextStyle(
                              color: data.isSelect
                                  ? Colors.white
                                  : Colors.black54),
                        ),
                      ),
                    ),
                  )
                      .toList(),
                )
              ],
            ),
          ),
        ),
        LibraryWidget(presentText: presentText, widget: showBooks(presentText, detailsVO??[], context))
      ],
    );


  }
}
