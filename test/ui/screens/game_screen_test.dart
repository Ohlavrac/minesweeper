import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/menu_entity.dart';
import 'package:minesweeper/ui/screens/game_screen/game_screen.dart';
import 'package:minesweeper/ui/widgets/field_widget.dart';

void main() {
  testWidgets("Should return 0 in counter on AppBar UI", (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.createBoard("easy"),
    )));

    final timerAppBar = find.widgetWithText(AppBar, "0");
    expect(timerAppBar, findsOne);
  });

  testWidgets("Should timer dont have 1 sec when game start",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.createBoard("easy"),
    )));

    final timerAppBar = find.widgetWithText(AppBar, "1");
    expect(timerAppBar, findsNothing);
  });

  testWidgets("Should return 10 in counter on AppBar UI", (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.createBoard("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 11));

    final timerAppBar = find.widgetWithText(AppBar, "11");
    expect(timerAppBar, findsOne);
  });

  testWidgets("Should return 10 flags in easy mode when game start",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.createBoard("easy"),
    )));

    final flags = find.widgetWithText(AppBar, "10");

    expect(flags, findsOne);
  });

  testWidgets("Should return 30 flags in medium mode when game start",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.createBoard("medium"),
    )));

    final flags = find.widgetWithText(AppBar, "30");

    expect(flags, findsOne);
  });

  testWidgets("Should return 100 flags in hard mode when game start",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.createBoard("hard"),
    )));

    final flags = find.widgetWithText(AppBar, "100");

    expect(flags, findsOne);
  });
}
