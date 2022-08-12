import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';
import 'package:reos_challenge/main.dart';
import 'package:reos_challenge/shared/providers/providers.dart';

void main() {
  Widget createApp() => MaterialApp(
        home: ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          child: const MaterialApp(
            home: AppState(),
          ),
        ),
      );

  group('Testing Homescreen', () {
    testWidgets('HomeScreen Scaffold', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder homeScreen = find.byKey(const Key('homeScreenkey'));
        expect(homeScreen, findsOneWidget);
      });
    });

    testWidgets('Category headers show', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder listHeader = find.byKey(const Key('listHeader'));

        expect(listHeader, findsWidgets);
      });
    });

    testWidgets('newsContinueBooksList is shown', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder newsContinueBooksList = find.byKey(const Key('newsContinueBooksList'));
        expect(newsContinueBooksList, findsOneWidget);
      });
    });

    testWidgets('Navigation bar is shown', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createApp());
        await tester.pumpAndSettle();

        final Finder navBar = find.byType(NavigationBar);
        expect(navBar, findsOneWidget);
      });
    });
  });
}
