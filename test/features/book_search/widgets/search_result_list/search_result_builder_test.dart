import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';
import 'package:reos_challenge/features/book_search/widgets/search_result_list/search_result_list.dart';
import 'package:reos_challenge/features/home/home_screen.dart';
import 'package:reos_challenge/shared/models/book.dart';
import 'package:reos_challenge/shared/providers/providers.dart';
import 'package:reos_challenge/shared/repositories/repositories.dart';

import '../../../../shared/providers/book_provider_test.mocks.dart';
import '../../../../shared/providers/test_data.dart';

final List<Book> expectedContinueBookList = [
  TestData.algorithms,
  TestData.structureAndInteroretationOfComputerPrograms,
  TestData.codeComplete
];
final List<Book> expectedNewBookList = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];
@GenerateMocks([FakeRepository])
void main() {
  late BuildContext buildcontext;
  late final MockFakeRepository repository = MockFakeRepository();
  late final BookProvider bookProvider = BookProvider(repository);
  final ThemeProvider themeProvider = ThemeProvider();

  Widget createApp() => MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<BookProvider>.value(value: bookProvider),
            ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
          ],
          builder: (context, child) => Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              buildcontext = context;
              return const HomeScreen();
            },
          ),
        ),
      );

  group('Test SearchResultBuilder:', () {
    setUp(() {
      when(repository.fetchNewBookList()).thenAnswer((_) async => expectedNewBookList);
      when(repository.fetchContinueBookList()).thenAnswer((_) async => expectedContinueBookList);
      bookProvider.bookSearchResultList = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];
      bookProvider.authorSearchResultList = [
        TestData.algorithms,
        TestData.structureAndInteroretationOfComputerPrograms,
        TestData.codeComplete
      ];
    });
    testWidgets('when search result list is not empty, buildList() returns a Material Widget', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          createApp(),
        );
        await tester.pump(const Duration(seconds: 2));

        final Widget searchResultList = SearchResultBuilder.buildList(
          buildcontext,
        );
        expect(searchResultList, isNotNull);
        expect(searchResultList, isInstanceOf<Material>());
        expect(
          searchResultList.key,
          const Key('searchResultKey'),
        );
      });
    });

    testWidgets('when search result list is not empty, buildList() returns a Column as child Widget', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          createApp(),
        );
        await tester.pump(const Duration(seconds: 2));

        final Widget searchResultList = SearchResultBuilder.buildList(
          buildcontext,
        );
        final Widget column = ((searchResultList as Material).child as Padding).child!;
        expect(
          column.key,
          const Key('searchResultDropdownList'),
        );
        expect(
          column,
          isInstanceOf<Column>(),
        );

        expect(
          (column as Column).children.length,
          8,
        );
      });
    });
  });
}
