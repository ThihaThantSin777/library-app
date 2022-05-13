import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/details_page.dart';

import 'details_page_test_data.dart';


Future<void> detailsPageTestForBook8(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook8Name), findsOneWidget);
  expect(find.text(detailsPageBook8Author), findsOneWidget);
  expect(find.text(detailsPageBook8ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook8Type), findsOneWidget);
  expect(find.text(detailsPageBook8PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook8SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook8SimilarBookName1), findsOneWidget);
  expect(find.text(detailsPageBook8SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> detailsPageTestForBook7(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook7Name), findsOneWidget);
  expect(find.text(detailsPageBook7Author), findsOneWidget);
  expect(find.text(detailsPageBook7ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook7Type), findsOneWidget);
  expect(find.text(detailsPageBook7PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook7SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook7SimilarBookName1), findsOneWidget);
  expect(find.text(detailsPageBook7SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> detailsPageTestForBook6(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook6Name), findsOneWidget);
  expect(find.text(detailsPageBook6Author), findsOneWidget);
  expect(find.text(detailsPageBook6ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook6Type), findsOneWidget);
  expect(find.text(detailsPageBook6PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook6SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook6SimilarBookName1), findsOneWidget);
  expect(find.text(detailsPageBook6SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> detailsPageTestForBook5(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook5Name), findsOneWidget);
  expect(find.text(detailsPageBook5Author), findsOneWidget);
  expect(find.text(detailsPageBook5ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook5Type), findsOneWidget);
  expect(find.text(detailsPageBook5PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook5SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook5SimilarBookName1), findsOneWidget);
  expect(find.text(detailsPageBook5SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> detailsPageTestForBook4(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook4Name), findsOneWidget);
  expect(find.text(detailsPageBook4Author), findsOneWidget);
  expect(find.text(detailsPageBook4ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook4Type), findsOneWidget);
  expect(find.text(detailsPageBook4PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook4SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook4SimilarBookName1), findsOneWidget);
 // expect(find.text(detailsPageBook4SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> detailsPageTestForBook3(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook3Name), findsOneWidget);
  expect(find.text(detailsPageBook3Author), findsOneWidget);
  expect(find.text(detailsPageBook3ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook3Type), findsOneWidget);
  expect(find.text(detailsPageBook3PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook3SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook3SimilarBookName1), findsOneWidget);
  //expect(find.text(detailsPageBook3SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> detailsPageTestForBook2(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook2Name), findsOneWidget);
  expect(find.text(detailsPageBook2Author), findsOneWidget);
  expect(find.text(detailsPageBook2ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook2Type), findsOneWidget);
  expect(find.text(detailsPageBook2PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook2SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook2SimilarBookName1), findsOneWidget);
  expect(find.text(detailsPageBook2SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> detailsPageTestForBook1(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);

  expect(find.text(detailsPageBook1Name), findsOneWidget);
  expect(find.text(detailsPageBook1Author), findsOneWidget);
  expect(find.text(detailsPageBook1ReviewCount), findsOneWidget);
  expect(find.text(detailsPageBook1Type), findsOneWidget);
  expect(find.text(detailsPageBook1PageCount), findsOneWidget);

  await _scroll(tester,-1000,listViewForDetailsPageKey);

  expect(find.text(detailsPageBook1SimilarTitle), findsOneWidget);
  expect(find.text(detailsPageBook1SimilarBookName1), findsOneWidget);
  expect(find.text(detailsPageBook1SimilarBookName2), findsOneWidget);

  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void>searchPageDetails(WidgetTester tester)async{
  expect(find.byType(DetailsPage), findsOneWidget);
  await tester.tap(find.byKey(const Key(backScreenKeyName)));
  await tester.pumpAndSettle(const Duration(seconds: 5));
}


Future<void>_scroll(WidgetTester tester,double offset,String keyName)async{
  await tester.drag(find.byKey( Key(keyName)),  Offset(0, offset));
  await tester.pumpAndSettle(const Duration(seconds: 5));

}