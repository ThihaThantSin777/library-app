import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/bloc/search_temp_bloc.dart';
import 'package:library_app/data/model/the_library_model.dart';
import 'package:library_app/data/model/the_library_model_impl.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/buy_links_vo.dart';
import 'package:library_app/data/vos/over_view_vo/lists_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/data/vos/view_more_vo/book_details_vo.dart';
import 'package:library_app/data/vos/view_more_vo/isbns_vo.dart';
import 'package:library_app/data/vos/view_more_vo/reviews_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:library_app/pages/search_page.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/home_session_view.dart';
import 'package:provider/provider.dart';

main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(ListsVOAdapter());
  Hive.registerAdapter(OverViewVOAdapter());
  Hive.registerAdapter(BookDetailsVOAdapter());
  Hive.registerAdapter(IsbnsVOAdapter());
  Hive.registerAdapter(ReviewsVOAdapter());
  Hive.registerAdapter(ViewMoreHiveVOAdapter());
  Hive.registerAdapter(ViewMoreVOAdapter());
  Hive.registerAdapter(SearchTempVOAdapter());
  Hive.registerAdapter(DetailsVOAdapter());

  await Hive.openBox<OverViewVO>(boxNameForOverViewVO);
  await Hive.openBox<ViewMoreHiveVO>(boxNameForViewMoreVO);
  await Hive.openBox<SearchTempVO>(boxNameForSearchTempVO);
  await Hive.openBox<DetailsVO>(boxNameForDetailsVO);

  // TheLibraryModel theLibraryModel=TheLibraryModelImpl();
  // print(theLibraryModel.getRecentSearch());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SearchTempBloc>.value(
        value: SearchTempBloc(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void navigateToSearchField(context) {
    SearchTempBloc searchTempBloc=Provider.of(context,listen: false);
    searchTempBloc.setIsEmpty=true;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchPage()));
  }
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (context)=>HomePageBloc(),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title:   Padding(
              padding: const EdgeInsets.only(bottom: padding5x,top: padding5x),
              child: ListTileTextFieldView(
                onTapTextField: () =>navigateToSearchField(context),
              ),
            ),
          ),
          bottomNavigationBar: Selector<HomePageBloc,int>(
            selector: (_,bloc)=>bloc.getCurrentIndex,
            builder: (_,currentIndex,child)=>
            BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                HomePageBloc homePageBloc=Provider.of(context,listen: false);
                homePageBloc.setCurrentIndex=index;
                controller.animateToPage(index,
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.my_library_books), label: 'Library'),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: HomePage(
            controller: controller,
          )),
    );
  }
}
