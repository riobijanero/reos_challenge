import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/features/home/widgets/widgets.dart';

import 'package:reos_challenge/shared/models/models.dart';
import 'package:reos_challenge/shared/providers/providers.dart';
import 'package:reos_challenge/shared/widgets/widgets.dart';
import 'package:reos_challenge/features/book_search/widgets/widgets.dart';

class NewsContinueBooks extends StatefulWidget {
  const NewsContinueBooks({
    this.topPadding = 0,
    Key? key,
  }) : super(key: key);

  final double topPadding;

  @override
  State<NewsContinueBooks> createState() => _NewsContinueBooksState();
}

class _NewsContinueBooksState extends State<NewsContinueBooks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding + 18, left: 20, right: 20),
      child: FutureBuilder(
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
              return ListView.separated(
                key: const Key('newsContinueBooksList'),
                itemCount: bookList.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (context, index) {
                  final Book book = bookList[index];
                  final BookListItem litsItem = BookListItem(
                    book: book,
                    onTab: () => GoRouter.of(context).go('/book/${book.id}'),
                  );
                  if (index == 0) {
                    return Column(
                      children: [
                        const ListHeader(title: 'Continue'),
                        const SizedBox(height: 180, child: ContinueBookList()),
                        const ListHeader(title: 'News'),
                        litsItem,
                      ],
                    );
                  }
                  return litsItem;
                },
                padding: const EdgeInsets.only(top: 10),
              );
            }
          }
          return const Center(child: Text('error'));
        },
      ),
    );
  }
}
