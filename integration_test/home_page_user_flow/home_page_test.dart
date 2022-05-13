import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/ebook_page.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:library_app/pages/view_more_page.dart';

import 'home_page_test_data.dart';

Future<void> homePageTest(WidgetTester tester)async{
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(EbookPage), findsOneWidget);

    expect(find.text(homagePageCategoryName1), findsWidgets);
    expect(find.text(homagePageCategoryName2), findsWidgets);
    expect(find.text(homePageBookName1), findsWidgets);
    expect(find.text(homePageBookName2), findsWidgets);
    expect(find.text(homePageBookName3), findsWidgets);
    expect(find.text(homePageBookName4), findsWidgets);

    await _scroll(tester, -600,keyListViewName);

    expect(find.text(homagePageCategoryName3), findsWidgets);
    expect(find.text(homagePageCategoryName4), findsWidgets);
    expect(find.text(homePageBookName5), findsWidgets);
    expect(find.text(homePageBookName6), findsWidgets);
    expect(find.text(homePageBookName7), findsWidgets);
    expect(find.text(homePageBookName8), findsWidgets);
}


Future<void>homePageTestForBook8(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName8)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>homePageTestForBook7(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName7)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>homePageTestForBook6(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName6)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>homePageTestForBook5(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName5)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>homePageTestForBook4(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName4)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>homePageTestForBook3(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName3)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>homePageTestForBook2(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName2)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>homePageTestForBook1(WidgetTester tester)async{
    await tester.tap(find.byKey(const Key(homePageBookNameTapKeyForBookName1)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>reScrollUp(WidgetTester tester)async{
    await _scroll(tester, 600, keyListViewName);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(EbookPage), findsOneWidget);
}


Future<void>_scroll(WidgetTester tester,double offset,String keyName)async{
    await tester.drag(find.byKey( Key(keyName)),  Offset(0, offset));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>reScrollUp2(WidgetTester tester)async{
    await _scroll(tester, 100, keyListViewName);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(EbookPage), findsOneWidget);
}

Future<void>viewMorePageForCategory1(WidgetTester tester)async{
    await tester.tap(find.text(homagePageCategoryName1));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(ViewMorePage), findsOneWidget);
    expect(find.text(viewMorePageBookName1), findsWidgets);
    expect(find.text(viewMorePageBookName2), findsWidgets);
    await tester.tap(find.byKey(const Key(keyViewMorePageBack)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
}