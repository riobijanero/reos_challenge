import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
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
  late FloatingSearchBarController _searchbarController;
  final double searchBarHeight = 48.0;

  @override
  void initState() {
    super.initState();
    _searchbarController = FloatingSearchBarController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchbarController.dispose();
  }

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
    _searchbarController.close();
  }

  void onAuthorSearchSubmitted(String searchterm) {
    if (searchterm.isEmpty) return;
    context.read<BookProvider>().onAuthorSearchCompleted(searchterm);
    _searchbarController.close();
  }

  Widget buildSearchResulDropDownList(BuildContext context) {
    return SearchResultBuilder.buildList(
      context,
      _searchbarController,
    );
  }

  Widget builScreenContent(BuildContext context) {
    return HomeScreenContentBuilder.builScreenContent(context, searchBarHeight);
  }

  List<Widget> buildSeachbarActionList(BuildContext context) {
    return [
      FloatingSearchBarAction.icon(
        showIfOpened: true,
        onTap: (() => onBookSearchSubmitted(_searchbarController.query)),
        icon: SvgIcon(
          assetUrl: 'assets/svgs/search.svg',
          color: colorScheme(context).primary,
        ),
      ),
      FloatingSearchBarAction.icon(
        showIfOpened: true,
        onTap: (() => context.read<ThemeProvider>().toggleThemeMode()),
        icon: Icon(
          key: const Key('themeIcon'),
          isLightTheme(context) ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          color: colorScheme(context).primary,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        return Scaffold(
          key: const Key('homeScreenkey'),
          body: FloatingSearchBar(
            key: const Key('searchBarKey'),
            controller: _searchbarController,
            body: builScreenContent(context),
            builder: (context, transition) => buildSearchResulDropDownList(context),
            onQueryChanged: (query) => onQueryChanged(query),
            onSubmitted: (query) => onBookSearchSubmitted(query),
            hint: 'Search for something',
            hintStyle: Theme.of(context).textTheme.labelMedium,
            scrollPadding: const EdgeInsets.only(top: 0),
            transitionDuration: const Duration(milliseconds: 500),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            openAxisAlignment: 0.0,
            width: MediaQuery.of(context).size.width,
            transition: CircularFloatingSearchBarTransition(),
            actions: buildSeachbarActionList(context),
            queryStyle: Theme.of(context).textTheme.headline5,
            iconColor: Theme.of(context).primaryColor,
            elevation: 5,
            backdropColor: Colors.black12,
            backgroundColor: Theme.of(context).colorScheme.background,
            border: !isLightTheme(context) ? BorderSide(color: colorScheme(context).outline) : null,
            clearQueryOnClose: false,
            height: searchBarHeight,
          ),
        );
      },
    );
  }
}
