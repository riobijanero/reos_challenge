import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _activeThemeMode = ThemeMode.system;
  ThemeMode get activeThemeMode => _activeThemeMode;

  void toggleThemeMode() {
    if (_activeThemeMode == ThemeMode.dark) {
      _activeThemeMode = ThemeMode.light;
    } else {
      _activeThemeMode = ThemeMode.dark;
    }

    notifyListeners();
  }

  static const Color accentColor = Color(0xff5B5EA6);
  static const Color accentColorDark = Color.fromARGB(255, 150, 153, 248);

  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    navigationBarTheme: const NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    dividerColor: const Color(0xffE1EBE8),
    colorSchemeSeed: accentColor,
    secondaryHeaderColor: const Color(0xffD9E5E2),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff263D36),
    ),
    textTheme: TextTheme(
      labelMedium: const TextStyle(
        fontFamily: 'Rubik',
        color: Color(0xff9AABA6),
        fontSize: 14,
      ),
      bodyText1: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
        color: Color(0xff181A19),
        fontSize: 16,
      ),
      headline1: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: accentColor,
        fontSize: 24,
      ),
      headline2: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 20,
      ),
      headline3: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 18,
      ),
      headline4: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: accentColor,
        fontSize: 14,
      ),
      headline5: const TextStyle(
        fontFamily: 'Rubik',
        color: Color(0xff181A19),
        fontSize: 14,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Rubik',
        color: const Color(0xff263D36).withOpacity(0.5),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: const TextStyle(
        fontFamily: 'Rubik',
        color: Color(0xff263D36),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: accentColor),
  );

  static const onDark = Color(0xffD9E5E2);
  ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: accentColorDark,
    backgroundColor: Colors.black,
    dividerColor: const Color(0xffE1EBE8),
    secondaryHeaderColor: accentColorDark,
    primaryIconTheme: const IconThemeData(
      color: onDark,
    ),
    iconTheme: const IconThemeData(color: onDark),
    textTheme: TextTheme(
      labelMedium: const TextStyle(
        fontFamily: 'Rubik',
        color: onDark,
        fontSize: 14,
      ),
      bodyText1: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
        color: onDark,
        fontSize: 16,
      ),
      headline1: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: accentColorDark,
        fontSize: 24,
      ),
      headline2: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: onDark,
        fontSize: 20,
      ),
      headline3: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: onDark,
        fontSize: 18,
      ),
      headline4: const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.bold,
        color: accentColorDark,
        fontSize: 14,
      ),
      headline5: const TextStyle(
        fontFamily: 'Rubik',
        color: onDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Rubik',
        color: const Color(0xffD9E5E2).withOpacity(0.7),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: const TextStyle(
        fontFamily: 'Rubik',
        color: onDark,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
