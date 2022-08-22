import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/features/home/widgets/widgets.dart';
import 'package:reos_challenge/shared/utils/utils.dart';

import 'package:reos_challenge/shared/widgets/widgets.dart';

import 'package:reos_challenge/shared/providers/providers.dart';

import 'package:reos_challenge/features/book_search/widgets/search_result_list/search_result_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textEditController = TextEditingController();
  final double searchBarHeight = 48.0;

  void onQueryChanged(String searchterm) {
    if (searchterm.isEmpty) {
      context.read<BookProvider>().cancelSearch();
      return;
    }
    context.read<BookProvider>().getSearchResults(searchterm);
  }

  void onBookSearchSubmitted(String searchterm) {
    if (searchterm.isEmpty) return;
    context.read<BookProvider>().onBookSearchCompleted(searchterm);
  }

  void onAuthorSearchSubmitted(String searchterm) {
    if (searchterm.isEmpty) return;
    context.read<BookProvider>().onAuthorSearchCompleted(searchterm);
  }

  Widget buildSearchResulDropDownList(BuildContext context) {
    if (textEditController.text.isEmpty) return const SizedBox();
    onQueryChanged(textEditController.text);
    return SearchResultBuilder.buildList(
      context,
    );
  }

  Widget builScreenContent(BuildContext context) {
    return HomeScreenContentBuilder.builScreenContent(context, searchBarHeight);
  }

  List<Widget> buildSeachbarActionList(BuildContext context) {
    return [
      IconButton(
        onPressed: () => context.read<ThemeProvider>().toggleThemeMode(),
        icon: Icon(
          key: const Key('themeIcon'),
          isLightTheme(context) ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          color: colorScheme(context).primary,
        ),
      ),
      IconButton(
        onPressed: () => onBookSearchSubmitted(textEditController.text),
        icon: SvgIcon(
          assetUrl: 'assets/svgs/search.svg',
          color: colorScheme(context).primary,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        return Scaffold(
          key: const Key('homeScreenkey'),
          body: CustomFloatingSearchbar(
            suffixiconList: buildSeachbarActionList(context),
            textEditController: textEditController,
            body: builScreenContent(context),
            searchbarResult: () => buildSearchResulDropDownList(context),
            hint: 'Search for something',
            hintStyle: Theme.of(context).textTheme.labelMedium,
            onSubmit: () => onAuthorSearchSubmitted(textEditController.text),
          ),
        );
      },
    );
  }
}
