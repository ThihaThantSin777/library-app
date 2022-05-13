import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/pages/ebook_page.dart';
import 'package:library_app/pages/library_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/home_session_view.dart';
import 'package:library_app/widget/menu_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.controller, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Tab> homeMyTabs = const [
    Tab(
      text: ebookText,
    ),
    Tab(text: audioBookText)
  ];
  final List<Tab> libraryMyTabs = const [
    Tab(
      text: yourBookText,
    ),
    Tab(text: yourshelvesText)
  ];


  final PageController controller;


  void navigateToDetailsView(DetailsVO detailsVO, context) {
    HomePageBloc homePageBloc = Provider.of(context, listen: false);
    homePageBloc.reSaveDetailsObject(detailsVO);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ChangeNotifierProvider<DetailsBloc>(
                create: (context) => DetailsBloc(detailsVO.title.toString()),
                child: const DetailsPage())));
  }

  void showMenu(context, DetailsVO detailsVO) {
    showModalBottomSheet(context: context, builder: (context) {
      return MenuWidget(
          onTap: () => navigateToAddToShelfScreen(context, detailsVO),
          imageURL: detailsVO.image.toString(),
          imageTitle: detailsVO.title.toString(),
          imageType: detailsVO.bookType.toString());
    });
  }

  void navigateToAddToShelfScreen(context, DetailsVO detailsVO) {
    Navigator.of(context).pop();
    ShelveBloc shelveBloc=Provider.of(context,listen: false);
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




  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: homeMyTabs.length,
        child: PageView(
            onPageChanged: (index) {

              HomePageBloc homePageBloc = Provider.of(context, listen: false);
              homePageBloc.setCurrentIndex = index;
              if(index==0){
                homePageBloc.setIsFloatingActionButtonShow=false;
              }
            },
            controller: controller,
            children: [
              ListView(
                key: const Key('List View'),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: padding10x),
                    child: Selector<HomePageBloc, List<DetailsVO>?>(
                      selector: (_, bloc) => bloc.getDetailsBook,
                      builder: (_, detailsBook, child) => Visibility(
                          visible: !(detailsBook?.isEmpty ?? true),
                          child: CarouselSliderView(
                            onTap: (detailsVO) {
                              navigateToDetailsView(detailsVO, context);
                            },
                            detailsVO: detailsBook ?? [],
                            onPressed: (detailsVO)=>showMenu(context,detailsVO),
                          )),
                    ),
                  ),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.blue,
                    tabs: homeMyTabs,
                  ),
                  Selector<HomePageBloc, OverViewVO?>(
                      selector: (_, bloc) => bloc.getOverViewVO,
                      builder: (_, overViewVO, child) {
                        int size = overViewVO?.lists?.length ?? 1;
                        return SizedBox(
                            height: MediaQuery.of(context).size.height *
                                (0.34 * size),
                            child: TabBarView(
                              children: [
                                EbookPage(listVO: overViewVO?.lists ?? [],scaffoldKey: scaffoldKey,),
                               Container()
                              ],
                            ));
                      })
                ],
              ),

             LibraryPage(
              scaffoldKey: scaffoldKey,
            ),
            ]));
  }
}






