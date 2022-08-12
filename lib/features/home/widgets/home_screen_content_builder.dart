import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/shared/providers/providers.dart';
import 'package:reos_challenge/features/book_search/widgets/widgets.dart';
import 'package:reos_challenge/features/home/widgets/widgets.dart';

class HomeScreenContentBuilder {
  static Widget builScreenContent(BuildContext context, double searchBarHeight) {
    final searchBarMargin = MediaQuery.of(context).viewPadding.top;
    final BookProvider bookProvider = context.read<BookProvider>();

    if (bookProvider.isSearchShown) {
      if (bookProvider.uiReesultList.isEmpty) {
        return const NoSearchResult();
      } else {
        return BookList(
          bookList: bookProvider.uiReesultList,
          topPadding: searchBarMargin + searchBarHeight,
        );
      }
    }
    return NewsContinueBooks(
      topPadding: searchBarMargin + searchBarHeight,
    );
  }
}
