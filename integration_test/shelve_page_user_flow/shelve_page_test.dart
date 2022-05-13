import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/your_shelves_page.dart';

import 'shelve_page_test_data.dart';

Future<void>shelfPageForRenameAndDelete(WidgetTester tester)async{
  await tester.tap(find.text(yourShelveText));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  expect(find.byType(YourShelvesPage), findsOneWidget);
  await tester.tap(find.text(shelfNameHiText));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  await tester.tap(find.byIcon(Icons.more_vert_outlined));
  await tester.pumpAndSettle(const Duration(seconds: 3));


  await tester.tap(find.text(renameShelfText));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  await tester.enterText(find.byKey(const Key(saveTextFieldKeyForShelf)), renameEnterText);
  await tester.tap(find.byIcon(Icons.check));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  expect(find.byType(YourShelvesPage), findsOneWidget);
  await tester.tap(find.text(renameEnterText));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  await tester.tap(find.byIcon(Icons.more_vert_outlined));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  await tester.tap(find.text(deleteShelfText));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  await tester.tap(find.byKey(const Key(deleteButtonKey)));
  await tester.pumpAndSettle(const Duration(seconds: 5));





}