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
      board: menu.initGame("easy"),
    )));

    final timerAppBar = find.widgetWithText(AppBar, "0");
    expect(timerAppBar, findsOne);
  });

  testWidgets("Should timer dont have 1 sec when game start",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    final timerAppBar = find.widgetWithText(AppBar, "1");
    expect(timerAppBar, findsNothing);
  });

  testWidgets("Should return 10 in counter on AppBar UI", (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
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
      board: menu.initGame("easy"),
    )));

    final flags = find.widgetWithText(AppBar, "10");

    expect(flags, findsOne);
  });

  testWidgets("Should return 30 flags in medium mode when game start",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    final flags = find.widgetWithText(AppBar, "30");

    expect(flags, findsOne);
  });

  testWidgets("Should return 100 flags in hard mode when game start",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    final flags = find.widgetWithText(AppBar, "100");

    expect(flags, findsOne);
  });

  testWidgets(
      "Should return 9 flags when the player marks a field in easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final field = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(field);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(field);

    await widgetTester.pump(const Duration(seconds: 1));

    final flags = find.widgetWithText(AppBar, "9");

    expect(flags, findsOne);
  });

  testWidgets(
      "Should return 0 flags when the player marks 10 fields in easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final field = find.byType(FieldWidget);

    for (int c = 0; c < 10; c++) {
      await widgetTester.pump(const Duration(seconds: 1));

      await widgetTester.tap(field.at(c));
      await widgetTester.pump(const Duration(milliseconds: 50));
      await widgetTester.tap(field.at(c));

      await widgetTester.pump(const Duration(seconds: 1));
    }

    final flags = find.widgetWithText(AppBar, "0");

    expect(flags, findsOne);
  });

  testWidgets(
      "Should return 1 flag when player marks 10 fields and then unmarks a field in easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final field = find.byType(FieldWidget);

    for (int c = 0; c < 10; c++) {
      await widgetTester.pump(const Duration(seconds: 1));

      await widgetTester.tap(field.at(c));
      await widgetTester.pump(const Duration(milliseconds: 50));
      await widgetTester.tap(field.at(c));

      await widgetTester.pump(const Duration(seconds: 1));
    }

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(field.at(0));
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(field.at(0));

    await widgetTester.pump(const Duration(seconds: 1));

    final flags = find.widgetWithText(AppBar, "1");

    expect(flags, findsOne);
  });

  testWidgets(
      "Should return 0 flags when the player marks 30 fields in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final field = find.byType(FieldWidget);

    for (int c = 0; c < 30; c++) {
      await widgetTester.pump(const Duration(seconds: 1));

      await widgetTester.tap(field.at(c));
      await widgetTester.pump(const Duration(milliseconds: 50));
      await widgetTester.tap(field.at(c));

      await widgetTester.pump(const Duration(seconds: 1));
    }

    final flags = find.widgetWithText(AppBar, "0");

    expect(flags, findsOne);
  });

  testWidgets(
      "Should return 1 flags when the player marks 30 fields and then unmarks a field in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final field = find.byType(FieldWidget);

    for (int c = 0; c < 30; c++) {
      await widgetTester.pump(const Duration(seconds: 1));

      await widgetTester.tap(field.at(c));
      await widgetTester.pump(const Duration(milliseconds: 50));
      await widgetTester.tap(field.at(c));

      await widgetTester.pump(const Duration(seconds: 1));
    }

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(field.at(0));
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(field.at(0));

    await widgetTester.pump(const Duration(seconds: 1));

    final flags = find.widgetWithText(AppBar, "1");

    expect(flags, findsOne);
  });

  testWidgets(
      "Should return 0 flags when the player marks 100 fields in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final field = find.byType(FieldWidget);

    for (int c = 0; c < 100; c++) {
      await widgetTester.pump(const Duration(seconds: 1));

      await widgetTester.tap(field.at(c));
      await widgetTester.pump(const Duration(milliseconds: 50));
      await widgetTester.tap(field.at(c));

      await widgetTester.pump(const Duration(seconds: 1));
    }

    final flags = find.widgetWithText(AppBar, "0");

    expect(flags, findsOne);
  });

  testWidgets(
      "Should return 1 flags when the player marks 100 fields and then unmarks a field in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final field = find.byType(FieldWidget);

    for (int c = 0; c < 100; c++) {
      await widgetTester.pump(const Duration(seconds: 1));

      await widgetTester.tap(field.at(c));
      await widgetTester.pump(const Duration(milliseconds: 50));
      await widgetTester.tap(field.at(c));

      await widgetTester.pump(const Duration(seconds: 1));
    }

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(field.at(1));
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(field.at(1));

    await widgetTester.pump(const Duration(seconds: 1));

    final flags = find.widgetWithText(AppBar, "1");

    expect(flags, findsOne);
  });

  /*testWidgets("Should return 64 fields widget on easy mode board",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fields = widgetTester.widgetList(find.byType(FieldWidget));

    expect(fields.length, 64);
  });*/

  testWidgets(
      "Should return true if field 1 color change to grey when player revel the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field 1 color change to grey when player revel the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field 1 color change to grey when player revel the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field 1 show a flag when player mark the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field 1 show a flag when player mark the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field 1 show a flag when player mark the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return return findsNothing if the player removes the flag from a field in easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    //Adiciona uma bandeira
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    //remove uma bandeira
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsNothing);
  });

  testWidgets(
      "Should return return findsNothing if the player removes the flag from a field in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    //Adiciona uma bandeira
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    //remove uma bandeira
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsNothing);
  });

  testWidgets(
      "Should return return findsNothing if the player removes the flag from a field in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(1);

    await widgetTester.pump(const Duration(seconds: 1));

    //Adiciona uma bandeira
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    //remove uma bandeira
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsNothing);
  });

  /*testWidgets(
      "Should return true if field 32 color change to grey when player revel the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).at(32);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });*/
}
