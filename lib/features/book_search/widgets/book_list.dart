import 'package:flutter/material.dart';

import 'package:reos_challenge/features/book_search/widgets/widgets.dart';

import 'package:reos_challenge/shared/models/models.dart';
import 'package:reos_challenge/shared/routers/router_utils.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key, required this.bookList, this.topPadding = 0}) : super(key: key);
  final List<Book> bookList;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: 20, right: 20),
      child: ListView.separated(
        itemCount: bookList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          final Book book = bookList[index];
          final BookListItem litsItem = BookListItem(
            book: book,
            onTab: () => presentDetailScreen(context: context, book: book),
          );
          return litsItem;
        },
        padding: const EdgeInsets.only(top: 10),
      ),
    );
  }
}
