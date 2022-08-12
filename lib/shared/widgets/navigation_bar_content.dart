import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:reos_challenge/shared/routers/routers.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.content,
    required this.currentIndex,
  });

  final Widget content;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final List<Widget> navDestination = destinations
        .map(
          (e) => NavigationDestination(
            icon: e.icon,
            label: e.label,
          ),
        )
        .toList();
    void onSelected(int index) {
      final destination = destinations[index];
      GoRouter.of(context).go(destination.route);
    }

    return Scaffold(
      body: content,
      bottomNavigationBar: NavigationBarTheme(
        data: Theme.of(context).navigationBarTheme,
        child: NavigationBar(
          destinations: navDestination,
          selectedIndex: currentIndex,
          onDestinationSelected: onSelected,
        ),
      ),
    );
  }
}
