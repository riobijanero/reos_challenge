import 'package:flutter/material.dart';

import 'package:reos_challenge/shared/models/models.dart';

import 'package:reos_challenge/shared/widgets/widgets.dart';

class ContinueBookItem extends StatelessWidget {
  const ContinueBookItem({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('continueBookItem'),
      children: [
        Stack(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: CustomNetworkImage(imageUrl: book.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 20,
                child: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 125,
          child: Column(
            children: [
              Text(
                book.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
        const SizedBox(height: 3),
        Text(
          book.author,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
