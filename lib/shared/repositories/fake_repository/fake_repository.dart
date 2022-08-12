import 'package:collection/collection.dart';
import 'package:reos_challenge/shared/models/models.dart';

import 'package:reos_challenge/shared/repositories/repository.dart';

import 'package:reos_challenge/shared/repositories/fake_repository/mock_data.dart';

class FakeRepository extends Repository {
  @override
  Future<List<Book>> searchBooks(String searchTerm) async {
    final List<Book> resultList =
        MockData.bookList.where((book) => book.title.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    return resultList;
  }

  @override
  Future<List<Book>> searchAuthors(String searchTerm) async {
    final List<Book> resultList =
        MockData.bookList.where((book) => book.author.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    return resultList;
  }

  @override
  Future<List<Book>> fetchContinueBookList() async {
    final List<Book> resultList = [];
    for (Book book in MockData.bookList) {
      if (MockData.continueReadBookIdList.contains(book.id)) {
        resultList.add(book);
      }
    }
    return resultList;
  }

  @override
  Future<List<Book>> fetchNewBookList() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final List<Book> resultList = [];
    for (Book book in MockData.bookList) {
      if (MockData.newBooksIdList.contains(book.id)) {
        resultList.add(book);
      }
    }
    return resultList;
  }

  @override
  Future<Book> searchBookById(String id) async {
    final Book? book = MockData.bookList.firstWhereOrNull((book) => book.id == id);
    if (book == null) throw 'No Book found for if $id';
    return book;
  }
}
