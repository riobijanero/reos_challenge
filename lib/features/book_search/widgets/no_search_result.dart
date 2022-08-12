import 'package:flutter/material.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sorry, your search has no results'),
    );
  }
}
