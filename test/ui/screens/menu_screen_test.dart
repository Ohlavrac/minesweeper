import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/ui/screens/game_screen/game_screen.dart';
import 'package:minesweeper/ui/screens/menu_screen/menu_screen.dart';
import 'package:minesweeper/ui/widgets/custom_menu_button_widget.dart';

void main() {
  testWidgets(
      "Should return GameScreen when player select easy mode on menu screen",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MenuScreen(),
    ));

    final customButtomEasyMode =
        find.widgetWithText(CustomMenuButtonWidget, "FACIL");

    await widgetTester.tap(customButtomEasyMode);
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    final gameScren = find.byType(GameScreen);
    expect(gameScren, findsOneWidget);
  });

  testWidgets(
      "Should return GameScreen when player select medium mode on menu screen",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MenuScreen(),
    ));

    final customButtomEasyMode =
        find.widgetWithText(CustomMenuButtonWidget, "MEDIO");

    await widgetTester.tap(customButtomEasyMode);
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    final gameScren = find.byType(GameScreen);
    expect(gameScren, findsOneWidget);
  });

  testWidgets(
      "Should return GameScreen when player select hard mode on menu screen",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MenuScreen(),
    ));

    final customButtomEasyMode =
        find.widgetWithText(CustomMenuButtonWidget, "DIFICIL");

    await widgetTester.tap(customButtomEasyMode);
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    final gameScren = find.byType(GameScreen);
    expect(gameScren, findsOneWidget);
  });
  testWidgets("Verify if exist a easy mode button in the menu",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MenuScreen(),
    ));
    //await widgetTester.pump();

    final customButtomEasyMode =
        find.widgetWithText(CustomMenuButtonWidget, "FACIL");

    expect(customButtomEasyMode, findsOneWidget);
  });

  testWidgets("Verify if exist a medium mode button in the menu",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MenuScreen(),
    ));
    await widgetTester.pump();

    final customButtomEasyMode =
        find.widgetWithText(CustomMenuButtonWidget, "MEDIO");

    expect(customButtomEasyMode, findsOneWidget);
  });

  testWidgets("Verify if exist a hard mode button in the menu",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MenuScreen(),
    ));
    await widgetTester.pump();

    final customButtomEasyMode =
        find.widgetWithText(CustomMenuButtonWidget, "DIFICIL");

    expect(customButtomEasyMode, findsOneWidget);
  });
}
