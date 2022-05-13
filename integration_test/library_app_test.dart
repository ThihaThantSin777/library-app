import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:integration_test/integration_test.dart';
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
import 'package:library_app/main.dart';
import 'package:library_app/persistant/hive_constant/hive_constant.dart';
import 'package:library_app/view_items/home_session_view.dart';

import 'details_page_user_flow/details_page_test.dart';
import 'home_page_user_flow/home_page_test.dart';
import 'library_page_user_flow/library_page_test.dart';
import 'shelve_page_user_flow/shelve_page_test.dart';


void main()async{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
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



    testWidgets('The library app test', (WidgetTester tester)async{
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 5));

    ///HomePage Test
     await homePageTest(tester);

    ///HomePage Tap Book8
    await homePageTestForBook8(tester);
    ///Details Page Test For Book8
    await detailsPageTestForBook8(tester);

    ///HomePage Tap Book7
    await homePageTestForBook7(tester);
    ///Details Page Test For Book7
    await detailsPageTestForBook7(tester);

    ///HomePage Tap Book6
    await homePageTestForBook6(tester);
    ///Details Page Test For Book6
    await detailsPageTestForBook6(tester);


    ///HomePage Tap Book5
    await homePageTestForBook5(tester);
    ///Details Page Test For Book5
    await detailsPageTestForBook5(tester);


    ///RescrollUp
     await reScrollUp(tester);

    ///HomePage Tap Book4
    await homePageTestForBook4(tester);
    ///Details Page Test For Book5
    await detailsPageTestForBook4(tester);


    ///HomePage Tap Book3
    await homePageTestForBook3(tester);
    ///Details Page Test For Book3
    await detailsPageTestForBook3(tester);


    ///HomePage Tap Book2
    await homePageTestForBook2(tester);
    ///Details Page Test For Book2
    await detailsPageTestForBook2(tester);


    ///HomePage Tap Book1
    await homePageTestForBook1(tester);
    ///Details Page Test For Book5
    await detailsPageTestForBook1(tester);


     await reScrollUp2(tester);

    ///CarouselSliderView
    expect(find.byType(CarouselSliderView), findsOneWidget);

    //
    // ///SearchPage
    // await searchPage(tester);
    //
    //
    // ///Search Result Page Book1
    // await searchResultPageBook1(tester);
    // await searchPageDetails(tester);
    //
    // ///Search Result Page Book2
    // await searchResultPageBook2(tester);
    // await searchPageDetails(tester);
    //
    // await backPageFromSearchPage(tester);
    //
    // ///ViewMorePage
    // await viewMorePageForCategory1(tester);


    ///LibraryPage For one time
    await libraryPageTestForOneTime(tester);

    ///Add to shelf page for one tome
    await addToShelfPageForOneTime(tester);

    ///LibraryPage For two time
    await libraryPageTestForTwoTime(tester);

    ///Add to shelf page for two tome
    await addToShelfPageForTwoTime(tester);

    ///Shelf Page
    await shelfPageForRenameAndDelete(tester);
  });
}