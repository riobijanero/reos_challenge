import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reos_challenge/shared/repositories/fake_repository/fake_repository.dart';

import 'package:reos_challenge/shared/routers/app_router.dart';

import 'package:reos_challenge/shared/providers/providers.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>(
          create: ((context) => BookProvider(FakeRepository())),
        )
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Storyways List',
              theme: themeProvider.lightTheme,
              darkTheme: themeProvider.darkTheme,
              themeMode: themeProvider.activeThemeMode,
              routeInformationProvider: appRouter.router.routeInformationProvider,
              routeInformationParser: appRouter.router.routeInformationParser,
              routerDelegate: appRouter.router.routerDelegate,
            );
          },
        );
      },
    );
  }
}
