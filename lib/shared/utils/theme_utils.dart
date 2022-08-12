import 'package:flutter/material.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
