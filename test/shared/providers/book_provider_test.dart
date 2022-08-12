import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reos_challenge/shared/models/models.dart';
import 'package:reos_challenge/shared/providers/book_provider.dart';
import 'package:reos_challenge/shared/repositories/repositories.dart';

import 'book_provider_test.mocks.dart';
import 'test_data.dart';

class MockCallbackFunction extends Mock {
  void call();
}

@GenerateMocks([FakeRepository])
void main() {
  late BookProvider bookProvider;
  late MockFakeRepository repository;
  final notifyListenerCallback = MockCallbackFunction();

  group('Testing BookProvider', () {
    setUp(() {
      repository = MockFakeRepository();
      bookProvider = BookProvider(repository)..addListener(notifyListenerCallback);
      reset(notifyListenerCallback);
      bookProvider.searchTerm = '';
      bookProvider.isSearchShown = false;
      bookProvider.bookSearchResultList = [];
      bookProvider.authorSearchResultList = [];
      bookProvider.uiReesultList = [];
    });

    test('When getSingleBook is called, then a Book object is returned', () async {
      final Book expectedBookId1 = TestData.cleanCode;
      const String id = '1';
      when(repository.searchBookById(id)).thenAnswer((_) async => expectedBookId1);
      final Book fetchedBook = await bookProvider.getSingleBook(id: id);
      expect(fetchedBook, expectedBookId1);
    });

    test('When getNewBookList is called, then a the correct List of book objects is returned', () async {
      final List<Book> expectedNewBookList = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];
      when(repository.fetchNewBookList()).thenAnswer((_) async => expectedNewBookList);
      final List<Book> fetchedNewBookList = await bookProvider.getNewBookList();
      expect(fetchedNewBookList, expectedNewBookList);
    });

    test('When getContinueBookList is called, then a the correct List of book objects is returned', () async {
      final List<Book> expectedNewBookList = [
        TestData.algorithms,
        TestData.structureAndInteroretationOfComputerPrograms,
        TestData.codeComplete
      ];
      when(repository.fetchContinueBookList()).thenAnswer((_) async => expectedNewBookList);
      final List<Book> fetchedNewBookList = await bookProvider.getContinueBookList();
      expect(fetchedNewBookList, expectedNewBookList);
    });

    test('When cancelSearch is called, the searchTerm String is cleared', () async {
      bookProvider.cancelSearch();
      expect(bookProvider.searchTerm, isEmpty);
    });

    test('When onAuthorSearchCompleted is called, then a the correct List of book objects is set', () async {
      const String searchTerm = 'Robert C. Martin';
      final List<Book> bookListOfUncleBob = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];

      when(repository.searchAuthors(searchTerm)).thenAnswer((_) async => bookListOfUncleBob);
      await bookProvider.onAuthorSearchCompleted(searchTerm);
      expect(bookProvider.uiReesultList, bookListOfUncleBob);
      expect(bookProvider.isSearchShown, true);
    });

    test('When onBookSearchCompleted is called, then a the correct List of book objects is set', () async {
      const String searchTerm = 'Clean';
      final List<Book> cleanBookList = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];

      when(repository.searchBooks(searchTerm)).thenAnswer((_) async => cleanBookList);
      await bookProvider.onBookSearchCompleted(searchTerm);
      expect(bookProvider.uiReesultList, cleanBookList);
      expect(bookProvider.isSearchShown, true);
      verify(notifyListenerCallback()).called(1);
    });

    test('When getBookSearchResults is called, then a the correct List of book objects is set', () async {
      const String searchTerm = 'Clean';
      final List<Book> cleanBookList = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];

      when(repository.searchBooks(searchTerm)).thenAnswer((_) async => cleanBookList);
      await bookProvider.getBookSearchResults(searchTerm);
      expect(bookProvider.bookSearchResultList, cleanBookList);
      expect(bookProvider.isSearchShown, false);
      verify(notifyListenerCallback()).called(1);
    });

    test('When getAuthorSearchResults is called, then a the correct List of book objects is set', () async {
      const String searchTerm = 'Robert C. Martin';
      final List<Book> bookListOfUncleBob = [TestData.cleanCode, TestData.cleanCoder, TestData.cleanArchitecture];

      when(repository.searchAuthors(searchTerm)).thenAnswer((_) async => bookListOfUncleBob);
      await bookProvider.getAuthorSearchResults(searchTerm);
      expect(bookProvider.authorSearchResultList, bookListOfUncleBob);
      expect(bookProvider.isSearchShown, false);
      verify(notifyListenerCallback()).called(1);
    });

    test('When getSearchResults is called, then a the correct List of book objects is set', () async {
      const String searchTerm = 'al';
      final List<Book> bookListAL = [TestData.algorithms, TestData.codeComplete];

      final List<Book> authorListAL = [TestData.artOfComputerProgramming, TestData.artOfComputerProgramming2];

      when(repository.searchBooks(searchTerm)).thenAnswer((_) async => bookListAL);
      when(repository.searchAuthors(searchTerm)).thenAnswer((_) async => authorListAL);

      await bookProvider.getSearchResults(searchTerm);
      expect(bookProvider.bookSearchResultList, bookListAL);
      expect(bookProvider.authorSearchResultList, authorListAL);
      expect(bookProvider.isSearchShown, false);
      verify(notifyListenerCallback()).called(2);
    });
  });
}
