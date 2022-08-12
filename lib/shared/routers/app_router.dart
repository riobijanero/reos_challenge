import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:reos_challenge/features/home/home_screen.dart';

import 'package:reos_challenge/shared/widgets/widgets.dart';

import 'package:reos_challenge/features/book_detail_screen.dart/book_detail_screen.dart';

import 'package:reos_challenge/shared/models/models.dart';

List<CustomNavigationDestination> destinations = [
  const CustomNavigationDestination(
    label: 'Home',
    icon: SvgIcon(assetUrl: 'assets/svgs/home.svg'),
    route: '/',
  ),
  const CustomNavigationDestination(
    label: 'Stack',
    icon: SvgIcon(assetUrl: 'assets/svgs/Stack.svg'),
    route: '/stack',
  ),
  const CustomNavigationDestination(
    label: 'Compass',
    icon: SvgIcon(assetUrl: 'assets/svgs/compass.svg'),
    route: '/compass',
  ),
  const CustomNavigationDestination(
    label: 'News',
    icon: SvgIcon(assetUrl: 'assets/svgs/news.svg'),
    route: '/news',
  ),
];

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  AppRouter(this.context);
  final BuildContext context;

  late final router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: BottomNavBar(
            key: _scaffoldKey,
            currentIndex: 0,
            content: HomeScreen(),
          ),
        ),
        routes: [
          GoRoute(
            name: 'book',
            path: 'book/:bid',
            builder: (context, state) {
              final String bookId = state.params['bid']!;
              return BookDetailScreen(bookId: bookId);
            },
          ),
        ],
      ),
      GoRoute(
        name: 'stack',
        path: '/stack',
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: BottomNavBar(
            key: _scaffoldKey,
            currentIndex: 1,
            content: Center(
              child: Text('This page is not implemented yet'),
            ),
          ),
        ),
      ),
      GoRoute(
        name: 'compass',
        path: '/compass',
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: BottomNavBar(
            key: _scaffoldKey,
            currentIndex: 2,
            content: Center(
              child: Text('This page is not implemented yet'),
            ),
          ),
        ),
      ),
      GoRoute(
        name: 'news',
        path: '/news',
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: BottomNavBar(
            key: _scaffoldKey,
            currentIndex: 3,
            content: Center(
              child: Text('This page is not implemented yet'),
            ),
          ),
        ),
      ),
    ],
  );
}
