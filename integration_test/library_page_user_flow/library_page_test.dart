import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/pages/create_shelves_page.dart';
import 'package:library_app/pages/library_page.dart';
import 'package:library_app/pages/your_book_page.dart';

import 'library_page_test_data.dart';

Future<void>libraryPageTestForOneTime(WidgetTester tester)async{

  ///Library Page
  await tester.tap(find.byIcon(Icons.my_library_books));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.byType(LibraryPage), findsOneWidget);
  expect(find.byType(YourBookPage), findsOneWidget);


  ///Chip
  await _scroll(tester, 50, chipScrollKey);
  await tester.tap(find.text(chipName));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await _scroll(tester, -50, chipScrollKey);
  await tester.tap(find.byIcon(Icons.close));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  ///Sort by
  await tester.tap(find.text(sortByRecentText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byKey(const Key(sortByTitleText)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.text(sortByTitleText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byKey(const Key(sortByAuthorText)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.text(sortByAuthorText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byKey(const Key(sortByRecentText)));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  ///Present by
  await tester.tap(find.byIcon(Icons.apps));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byKey(const Key(presentLargeGridText)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byIcon(Icons.drag_indicator));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byKey(const Key(presentListText)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byIcon(Icons.list));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.byKey(const Key(presentGridText)));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  ///Add to shelf bottom sheet
  await tester.tap(find.byKey(const Key(menuText1)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.text(addToShelfText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>addToShelfPageForOneTime(WidgetTester tester)async{
  expect(find.byType(AddToShelfPage), findsOneWidget);
  await tester.tap(find.text(addToNewText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.byType(CreateShelvesPage), findsOneWidget);
  await tester.enterText(find.byKey(const Key(saveTextFieldKey)), shelfText1);
  await tester.tap(find.byIcon(Icons.check));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.byType(AddToShelfPage), findsOneWidget);
  await tester.tap(find.text(shelfText1));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}


Future<void>libraryPageTestForTwoTime(WidgetTester tester)async{

  ///Add to shelf bottom sheet
  await tester.tap(find.byKey(const Key(menuText2)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.tap(find.text(addToShelfText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>addToShelfPageForTwoTime(WidgetTester tester)async{
  expect(find.byType(AddToShelfPage), findsOneWidget);
  await tester.tap(find.text(addToNewText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.byType(CreateShelvesPage), findsOneWidget);
  await tester.enterText(find.byKey(const Key(saveTextFieldKey)), shelfText2);
  await tester.tap(find.byIcon(Icons.check));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.byType(AddToShelfPage), findsOneWidget);
  await tester.tap(find.text(shelfText2));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>_scroll(WidgetTester tester,double offset,String keyName)async{
  await tester.drag(find.byKey( Key(keyName)),  Offset(offset, 0));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}