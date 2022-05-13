import 'package:flutter/material.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/pages/your_book_page.dart';
import 'package:library_app/pages/your_shelves_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key,required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Tab> libraryMyTabs = const [
    Tab(
      text: yourBookText,
    ),
    Tab(text: yourshelvesText)
  ];
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
    }else if(presentListText==presentText){
      for(int i=0;i<length;i++){
        fixNumber=fixNumber+0.06;
      }

    }else{
      fixNumber=9.9;
    }

   // print(fixNumber);
    return fixNumber;
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_){
      HomePageBloc homePageBloc=Provider.of(context,listen: false);
      homePageBloc.setIsFloatingActionButtonShow=false;
    });

    return DefaultTabController(
      length: libraryMyTabs.length,
      child:
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
              builder: (_, presentText, child) {

                return   Selector<LibraryBloc, List<DetailsVO>?>(
                    selector: (_, bloc) => bloc.getDetailsVO,
                    shouldRebuild: (pre, next) => pre != next,
                    builder: (_, detailsVO, child) {
                      int length=detailsVO?.length??1;
                      return SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height *getHeight(length, presentText),
                        child: TabBarView(
                          children: [
                            YourBookPage(
                              scaffoldKey: scaffoldKey,
                              detailsVO: detailsVO,
                              presentText: presentText,
                            ),
                            const YourShelvesPage()
                          ],
                        ),
                      );
                    });
              }

          )


    ])
    );
  }
}
