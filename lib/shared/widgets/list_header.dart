import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('listHeader'),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
