import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/shared/providers/book_provider.dart';
import 'package:reos_challenge/shared/routers/router_utils.dart';
import 'package:reos_challenge/shared/widgets/widgets.dart';

import 'package:reos_challenge/features/book_search/widgets/search_result_list/search_result_list.dart';

class SearchResultBuilder {
  static Widget buildList(
    BuildContext context,
    FloatingSearchBarController searchbarController,
  ) {
    if (searchbarController.query.isNotEmpty) {
      final List<Widget> bookResultList = context.read<BookProvider>().bookSearchResultList.map((book) {
        return Column(
          children: [
            SearchResultListItem(
              book: book,
              onTab: () {
                searchbarController.query = '';
                searchbarController.close();
                presentDetailScreen(context: context, book: book);
              },
            ),
            Divider(color: Theme.of(context).dividerColor),
          ],
        );
      }).toList();

      final List<Widget> authorResultList = context.read<BookProvider>().authorSearchResultList.map((book) {
        return Column(
          children: [
            SearchResultListItem(
              book: book,
              onTab: () {
                searchbarController.query = '';
                searchbarController.close();
                presentDetailScreen(context: context, book: book);
              },
            ),
            Divider(color: Theme.of(context).dividerColor),
          ],
        );
      }).toList();

      return Material(
        color: Theme.of(context).colorScheme.background,
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            key: const Key('searchResultDropdownList'),
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[if (bookResultList.isNotEmpty) const ListHeader(title: 'Books')] +
                bookResultList +
                [if (authorResultList.isNotEmpty) const ListHeader(title: 'Authors')] +
                authorResultList,
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
