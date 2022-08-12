import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/shared/providers/providers.dart';

import 'package:reos_challenge/shared/models/models.dart';

import 'package:reos_challenge/shared/utils/utils.dart';

import 'package:reos_challenge/shared/widgets/widgets.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({
    Key? key,
    required this.bookId,
  }) : super(key: key);
  final String bookId;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<BookProvider>().getSingleBook(id: widget.bookId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final Book book = snapshot.data as Book;
          return _BookDetails(book: book);
        }
        return Center(child: Text('error fetching Book with id: ${widget.bookId}'));
      },
    );
  }
}

class _BookDetails extends StatelessWidget {
  const _BookDetails({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('bookDetails'),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 3 / 5,
            child: AspectRatio(
              aspectRatio: 4 / 4,
              child: CustomNetworkImage(imageUrl: book.imageUrl),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 5 + 20,
              width: MediaQuery.of(context).size.width,
              decoration: detailedWidgetDecoration(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        book.title,
                        style: textTheme(context).headline1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        book.author,
                        style: textTheme(context).headline2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormatter.formatDate(book.publishDate),
                        style: textTheme(context).headline3,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          const ListHeader(title: 'Descritpion:'),
                          Text(
                            book.description,
                            style: textTheme(context).bodyText1,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration detailedWidgetDecoration(BuildContext context) => BoxDecoration(
      color: colorScheme(context).background,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[400]!,
          blurRadius: 3,
          offset: const Offset(1, 1),
        )
      ],
    );
