import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';
import 'package:reos_challenge/features/book_search/widgets/widgets.dart';
import 'package:reos_challenge/features/home/home_screen.dart';
import 'package:reos_challenge/main.dart';
import 'package:reos_challenge/shared/models/models.dart';
import 'package:reos_challenge/shared/providers/providers.dart';
import 'package:reos_challenge/shared/repositories/fake_repository/fake_repository.dart';

import '../../shared/providers/book_provider_test.mocks.dart';
import '../../shared/providers/test_data.dart';

@GenerateMocks([FakeRepository])
void main() {
  Widget createApp() => MaterialApp(
        home: ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          child: const MaterialApp(
            home: AppState(),
          ),
        ),
      );

  group('Testing Homescreen', () {
    testWidgets('HomeScreen Scaffold', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder homeScreen = find.byKey(const Key('homeScreenkey'));
        expect(homeScreen, findsOneWidget);
      });
    });

    testWidgets('Category headers show', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder listHeader = find.byKey(const Key('listHeader'));

        expect(listHeader, findsWidgets);
      });
    });

    testWidgets('newsContinueBooksList is shown', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder newsContinueBooksList = find.byKey(const Key('newsContinueBooksList'));
        expect(newsContinueBooksList, findsOneWidget);
      });
    });

    testWidgets('Navigation bar is shown', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder navBar = find.byType(NavigationBar);
        expect(navBar, findsOneWidget);
      });
    });
  });

  group('test searchResult display:', () {
    late final MockFakeRepository repository = MockFakeRepository();
    late final BookProvider bookProvider = BookProvider(repository);
    final ThemeProvider themeProvider = ThemeProvider();
    final List<Book> expectedContinueBookList = [
      TestData.algorithms,
      TestData.structureAndInteroretationOfComputerPrograms,
      TestData.codeComplete
    ];
    final List<Book> expectedNewBookList = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];
    final List<Book> cleanBookList = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];

    Widget createMultiProviderApp() => MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<BookProvider>.value(value: bookProvider),
              ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
            ],
            builder: (context, child) => Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return const HomeScreen();
              },
            ),
          ),
        );
    setUp(() {
      when(repository.fetchNewBookList()).thenAnswer((_) async => expectedNewBookList);
      when(repository.fetchContinueBookList()).thenAnswer((_) async => expectedContinueBookList);
    });
    testWidgets('When search for searchterm, then Booklist with results is displayed', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createMultiProviderApp());
        await tester.pump(const Duration(seconds: 1));
        when(repository.searchBooks('clean')).thenAnswer((_) async => cleanBookList);
        const String searchTerm = 'clean';
        await bookProvider.onBookSearchCompleted(searchTerm);
        await tester.pump(const Duration(seconds: 2));
        final Finder booklist = find.byType(BookList);
        final Finder bookListItem = find.byType(BookListItem);
        expect(booklist, findsOneWidget);
        expect(bookListItem, findsWidgets);
      });
    });

    testWidgets('When search with search term that returns no search results, a No-results-screen is shown',
        (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createMultiProviderApp());
        await tester.pump(const Duration(seconds: 1));
        const String searchTerm = 'kwebdf jkwebf';
        when(repository.searchBooks('kwebdf jkwebf')).thenAnswer((_) async => []);
        await bookProvider.onBookSearchCompleted(searchTerm);
        await tester.pump(const Duration(seconds: 2));
        final Finder noSearchResultsScreen = find.byType(NoSearchResult);
        expect(noSearchResultsScreen, findsOneWidget);
        final Finder bookListItem = find.byType(BookListItem);
        expect(bookListItem, findsNothing);
      });
    });
  });
}
