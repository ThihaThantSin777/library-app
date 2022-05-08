import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/pages/ebook_page.dart';
import 'package:library_app/pages/your_book_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/home_session_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.controller});

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
    HomePageBloc homePageBloc=Provider.of(context,listen: false);
    homePageBloc.reSaveDetailsObject(detailsVO);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
          create: (context)=>DetailsBloc(detailsVO.title.toString()),
            child: const DetailsPage())));
  }
  double getHeight(int length,String presentText){
    double fixNumber=presentText==presentGridText?0.24:presentText==presentLargeGridText?0.33:0.23;
    if(presentText==presentGridText){
      int count=0;
      if(length<=3){
        return fixNumber+0.12;
      }else{
        int temp=length;
        while(temp>3){
          count++;
          temp=temp-3;
        }

      }
      for(int i=0;i<count;i++){
        fixNumber=0.24+fixNumber;
      }
      fixNumber=fixNumber+0.12;
    }else if(presentText==presentLargeGridText){
      int count=0;
      if(length<=2){
        return fixNumber+0.12;
      }else{
        int temp=length;
        while(temp>2){
          count++;
          temp=temp-2;
        }

      }
      for(int i=0;i<count;i++){
        fixNumber=0.44+fixNumber;
      }
      fixNumber=fixNumber+0.12;
    }else{
      for(int i=0;i<length;i++){
        fixNumber=fixNumber+0.06;
      }
     
    }
    return fixNumber;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (context)=>HomePageBloc(),
      child: DefaultTabController(
          length: homeMyTabs.length,
          child: PageView(
              onPageChanged: (index) {
                HomePageBloc homePageBloc = Provider.of(context, listen: false);
                homePageBloc.setCurrentIndex = index;
              },
              controller: controller,
              children: [
                ListView(
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
                                  EbookPage(listVO: overViewVO?.lists ?? []),
                                  Container()
                                ],
                              ));
                        })
                  ],
                ),
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: padding10x),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.blue,
                        tabs: libraryMyTabs,
                      ),
                    ),
                    Selector<LibraryBloc, String>(
                      selector: (_, bloc) => bloc.getPresentForm,
                      builder: (_, presentText, child) =>
                          Selector<LibraryBloc, List<DetailsVO>?>(
                              selector: (_, bloc) => bloc.getDetailsVO,
                              shouldRebuild: (pre, next) => pre != next,
                              builder: (_, detailsVO, child) {
                                int length=detailsVO?.length??1;
                                return detailsVO?.isEmpty ?? true
                                    ? SizedBox(
                                  height: MediaQuery.of(context).size.height*0.7,
                                      child:  Center(
                                          child:  Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const[
                                              Icon(Icons.sentiment_dissatisfied,color: Colors.black38,size: 100,),
                                              SizedBox(
                                                height: padding5x,
                                              ),
                                              Text('No books are added in library',style: TextStyle(color: Colors.black38),),
                                            ],
                                          ),
                                        ),
                                    )
                                    : SizedBox(
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *getHeight(length, presentText),
                                        child: TabBarView(
                                          children: [
                                            YourBookPage(
                                              detailsVO: detailsVO,
                                              presentText: presentText,
                                            ),
                                            Container()
                                          ],
                                        ),
                                      );
                              }),
                    )
                  ],
                )
              ])),
    );
  }
}

