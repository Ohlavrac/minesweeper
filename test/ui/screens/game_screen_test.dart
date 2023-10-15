import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/menu_entity.dart';
import 'package:minesweeper/ui/screens/game_screen/game_screen.dart';

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
}
