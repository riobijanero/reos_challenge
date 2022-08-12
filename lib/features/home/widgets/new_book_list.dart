import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/shared/models/models.dart';
import 'package:reos_challenge/shared/providers/providers.dart';

import 'package:reos_challenge/features/book_search/widgets/widgets.dart';

class NewBookList extends StatelessWidget {
  const NewBookList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<BookProvider>().getNewBookList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final List<Book> bookList = snapshot.data! as List<Book>;
          if (bookList.isEmpty) {
            const SizedBox();
          } else {
            return ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                final Book book = bookList[index];
                final BookListItem litsItem = BookListItem(
                  book: book,
                  onTab: () => GoRouter.of(context).go('/book/${book.id}'),
                );
                return Column(
                  children: [
                    if (index > 0) const Divider(),
                    litsItem,
                  ],
                );
              },
              padding: const EdgeInsets.only(top: 10),
            );
          }
        }
        return const Center(child: Text('error'));
      },
    );
  }
}
