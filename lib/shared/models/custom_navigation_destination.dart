import 'package:flutter/material.dart';

class CustomNavigationDestination {
  const CustomNavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Widget icon;
  final Widget? child;
}
