import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/search_page.dart';
import 'package:library_app/pages/search_result_page.dart';

import 'search_page_test_data.dart';

Future<void> searchPage(WidgetTester tester)async{
  await tester.tap(find.byKey(const Key(listTileTextFieldKey)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.byType(SearchPage), findsOneWidget);

  await tester.enterText(find.byKey(const Key(enterTextFieldKey)), enterTextHello);
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.text(searchText1), findsOneWidget);
  expect(find.text(searchText2), findsOneWidget);

  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
  await tester.pumpAndSettle(const Duration(seconds: 3));


}

Future<void>searchResultPageBook1(WidgetTester tester)async{
  expect(find.byType(SearchResultPage), findsOneWidget);
  await tester.tap(find.byKey(const Key(tapBookID1)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>searchResultPageBook2(WidgetTester tester)async{
  expect(find.byType(SearchResultPage), findsOneWidget);
  await tester.tap(find.byKey(const Key(tapBookID2)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}


Future<void>backPageFromSearchPage(WidgetTester tester)async{
  expect(find.byType(SearchResultPage), findsOneWidget);
  await tester.tap(find.byKey(const Key(backSearchResultPageKey)));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  expect(find.byType(SearchPage), findsOneWidget);
  await tester.tap(find.byKey(const Key(backSearchPageKey)));
  await tester.pumpAndSettle(const Duration(seconds: 3));

}