import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/shared/models/models.dart';
import 'package:reos_challenge/shared/providers/providers.dart';

import 'package:reos_challenge/features/home/widgets/widgets.dart';

class ContinueBookList extends StatelessWidget {
  const ContinueBookList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: const Key('continueBookList'),
      future: context.read<BookProvider>().getContinueBookList(),
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
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final ContinueBookItem litsItem = ContinueBookItem(book: bookList[index]);
                return Column(
                  children: [
                    litsItem,
                  ],
                );
              },
              padding: const EdgeInsets.only(top: 10),
            );
          }
        }
        return const Center(child: Text('error showing list'));
      },
    );
  }
}
