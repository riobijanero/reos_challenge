import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:reos_challenge/features/book_search/widgets/widgets.dart';
import 'package:reos_challenge/main.dart';

void main() {
  group('Integration Tests', () {
    testWidgets("""App opens home Screen Screen when app starts""", (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const AppState());
        await tester.pumpAndSettle();
        final Finder homeScreenkey = find.byKey(const Key('homeScreenkey'));
        expect(homeScreenkey, findsOneWidget);
      });
    });

    testWidgets("""typing in the searchbar shows results""", (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const AppState());
        await tester.pump(const Duration(seconds: 2));

        final Finder searchbar = find.byType(
          FloatingSearchBar,
        );
        expect(searchbar, findsOneWidget);
      });
    });
    testWidgets("""Taping on a listTile leads to the Bookdetail Screen""", (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const AppState());
        await tester.pumpAndSettle();

        final Finder bookListItem = find.byType(BookListItem).first;
        expect(bookListItem, findsOneWidget);
        await tester.tap(bookListItem);
        await tester.pumpAndSettle();

        final Finder bookDetailScreen = find.byKey(const Key('bookDetails'));
        await tester.pumpAndSettle();

        expect(bookDetailScreen, findsOneWidget);
      });
    });
  });
}
