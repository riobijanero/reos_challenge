import 'package:flutter/material.dart';

import 'package:reos_challenge/shared/repositories/repositories.dart';

import 'package:reos_challenge/shared/models/models.dart';

class BookProvider extends ChangeNotifier {
  final Repository repository;
  BookProvider(this.repository);

  List<Book> bookSearchResultList = [];
  List<Book> authorSearchResultList = [];
  List<Book> uiReesultList = [];

  String searchTerm = '';
  bool isSearchShown = false;

  Future<Book> getSingleBook({required String id}) async {
    return await repository.searchBookById(id);
  }

  Future<void> getSearchResults(String searchTerm) async {
    await getBookSearchResults(searchTerm);
    await getAuthorSearchResults(searchTerm);
  }

  Future<void> getBookSearchResults(String searchTerm) async {
    final List<Book> bookResultList = await repository.searchBooks(searchTerm);
    bookSearchResultList = bookResultList;
    notifyListeners();
  }

  Future<void> getAuthorSearchResults(String searchTerm) async {
    final List<Book> authorResultList = await repository.searchAuthors(searchTerm);
    authorSearchResultList = authorResultList;
    notifyListeners();
  }

  Future<void> onBookSearchCompleted(
    String searchTerm,
  ) async {
    final List<Book> searchResultList = await repository.searchBooks(searchTerm);
    uiReesultList = searchResultList;
    isSearchShown = true;
    notifyListeners();
  }

  Future<void> onAuthorSearchCompleted(String searchTerm) async {
    final List<Book> searchResultList = await repository.searchAuthors(searchTerm);
    uiReesultList = searchResultList;
    isSearchShown = true;
    notifyListeners();
  }

  void cancelSearch() {
    bookSearchResultList.clear();
    notifyListeners();
  }

  Future<List<Book>> getNewBookList() async {
    return await repository.fetchNewBookList();
  }

  Future<List<Book>> getContinueBookList() async {
    return await repository.fetchContinueBookList();
  }
}
