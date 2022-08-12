import 'package:flutter/material.dart';

import 'package:reos_challenge/shared/models/models.dart';

import 'package:reos_challenge/shared/utils/utils.dart';

import 'package:reos_challenge/shared/widgets/widgets.dart';

class ListItemDetails extends StatelessWidget {
  const ListItemDetails({
    Key? key,
    required this.book,
    this.showPublishDate = true,
  }) : super(key: key);

  final Book book;
  static const String _calendarIcon = 'assets/svgs/Calendar.svg';
  final bool showPublishDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              book.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            book.author,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 14,
          ),
          if (showPublishDate)
            Row(
              children: [
                SvgIcon(
                  assetUrl: _calendarIcon,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    DateFormatter.formatDate(book.publishDate),
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
