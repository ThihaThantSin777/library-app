import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/bloc/search_temp_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/buy_links_vo.dart';
import 'package:library_app/data/vos/over_view_vo/lists_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/data/vos/view_more_vo/book_details_vo.dart';
import 'package:library_app/data/vos/view_more_vo/isbns_vo.dart';
import 'package:library_app/data/vos/view_more_vo/reviews_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_hive_vo.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';
import 'package:library_app/pages/create_shelves_page.dart';
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
  Hive.registerAdapter(ShelveVOAdapter());

  await Hive.openBox<OverViewVO>(boxNameForOverViewVO);
  await Hive.openBox<ViewMoreHiveVO>(boxNameForViewMoreVO);
  await Hive.openBox<SearchTempVO>(boxNameForSearchTempVO);
  await Hive.openBox<DetailsVO>(boxNameForDetailsVO);
  await Hive.openBox<ShelveVO>(boxNameForShelveVO);

  // TheLibraryModel theLibraryModel = TheLibraryModelImpl();
  // theLibraryModel.getDetailsFromDataBase().listen((event) {
  //   event?.forEach((element) {
  //     print(element.category.toString());
  //   });
  // });
  runApp( MyApp(),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void navigateToSearchField(context) {
    SearchTempBloc searchTempBloc = Provider.of(context, listen: false);
    searchTempBloc.setIsEmpty = true;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchPage(scaffoldKey: _scaffoldKey,)));
  }

  void navigateToCreateShelfView(context) {
    ShelveBloc shelveBloc = Provider.of(context, listen: false);
    shelveBloc.setIsShow = false;
    shelveBloc.setIsEdit=false;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateShelvesPage()));
  }

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchTempBloc>.value(
          value: SearchTempBloc(),
        ),
        ChangeNotifierProvider<HomePageBloc>.value(
          value: HomePageBloc(),
        ),
        ChangeNotifierProvider<LibraryBloc>.value(
          value: LibraryBloc(),
        ),
        ChangeNotifierProvider<ShelveBloc>.value(value: ShelveBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        home: Scaffold(
          key: _scaffoldKey,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Selector<HomePageBloc, bool>(
                selector: (_, bloc) => bloc.getIsFloatingActionButtonShow,
                builder: (_, isShow, child) => isShow
                    ? Builder(
                      builder: (context) {
                        return FloatingActionButton.extended(
                            onPressed: () {
                              navigateToCreateShelfView(context);
                            },
                            label: Row(
                              children: const [Icon(Icons.edit), Text('Create new')],
                            ),
                          );
                      }
                    )
                    : Container(
                      )),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(bottom: padding5x, top: padding5x),
                child: Builder(
                  builder: (context) {
                    return ListTileTextFieldView(
                      onTapTextField: () => navigateToSearchField(context),
                    );
                  }
                ),
              ),
            ),
            bottomNavigationBar: ChangeNotifierProvider(
              create: (context)=>HomePageBloc(),
              child: Selector<HomePageBloc, int>(
                selector: (_, bloc) => bloc.getCurrentIndex,
                builder: (_, currentIndex, child) => Builder(
                  builder: (context) {
                    return BottomNavigationBar(
                      currentIndex: currentIndex,
                      onTap: (index) {
                        HomePageBloc homePageBloc = Provider.of<HomePageBloc>(context, listen: false);
                        homePageBloc.setCurrentIndex = index;
                        controller.animateToPage(index,
                            duration: const Duration(seconds: 1), curve: Curves.ease);
                      },
                      items: const [
                        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(
                                Icons.my_library_books), label: 'Library'),
                      ],
                    );
                  }
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: HomePage(
              controller: controller,
              scaffoldKey: _scaffoldKey,
            )),
      ),
    );
  }
}
