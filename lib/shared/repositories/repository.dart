import 'package:reos_challenge/shared/models/models.dart';

abstract class Repository {
  Future<Book> searchBookById(String id);
  Future<List<Book>> searchBooks(String searchTerm);
  Future<List<Book>> searchAuthors(String searchTerm);
  Future<List<Book>> fetchContinueBookList();
  Future<List<Book>> fetchNewBookList();
}
