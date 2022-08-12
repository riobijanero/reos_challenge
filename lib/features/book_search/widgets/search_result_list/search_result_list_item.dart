import 'package:flutter/material.dart';

import 'package:reos_challenge/shared/models/models.dart';

import 'package:reos_challenge/features/book_search/widgets/book_list_item/list_item_details.dart';

import 'package:reos_challenge/shared/widgets/widgets.dart';

class SearchResultListItem extends StatelessWidget {
  const SearchResultListItem({Key? key, required this.book, required this.onTab}) : super(key: key);
  final Book book;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTab(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 110,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 3 / 4.5,
                child: CustomNetworkImage(imageUrl: book.imageUrl),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: ListItemDetails(
                book: book,
                showPublishDate: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
