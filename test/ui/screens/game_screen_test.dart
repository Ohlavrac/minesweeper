import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';
import 'package:minesweeper/domain/entities/menu_entity.dart';
import 'package:minesweeper/ui/screens/game_screen/game_screen.dart';
import 'package:minesweeper/ui/widgets/field_widget.dart';

void main() {
  late BoardEntity boardEasyMode;
  late BoardEntity boardMediumMode;
  late BoardEntity boardHardMode;

  FieldEntity fieldList = FieldEntity(
      hasBomb: false,
      isChecked: false,
      wasRevelated: false,
      neighboringPumps: 0);

  setUp(() {
    boardEasyMode = BoardEntity(
        fields: List.generate(8 * 8, (index) => fieldList),
        lines: 8,
        columns: 8,
        flags: 10,
        bombs: 10,
        timer: 0,
        fieldsOpen: List.generate(8 * 8, (index) => false),
        bombsMarkedFlag: List.generate(8 * 8, (index) => false));

    boardMediumMode = BoardEntity(
        fields: List.generate(10 * 16, (index) => fieldList),
        lines: 10,
        columns: 16,
        flags: 30,
        bombs: 30,
        timer: 0,
        fieldsOpen: List.generate(10 * 16, (index) => false),
        bombsMarkedFlag: List.generate(10 * 16, (index) => false));

    boardHardMode = BoardEntity(
        fields: List.generate(24 * 24, (index) => fieldList),
        lines: 24,
        columns: 24,
        flags: 100,
        bombs: 100,
        timer: 0,
        fieldsOpen: List.generate(24 * 24, (index) => false),
        bombsMarkedFlag: List.generate(24 * 24, (index) => false));
  });

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

  testWidgets("Should return 64 fields widget on easy mode board",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
      columns: boardEasyMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fields = widgetTester.widgetList(find.byType(FieldWidget));

    expect(fields.length, 64);
  });

  testWidgets("Should return 160 fields widget on medium mode board",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
      columns: boardMediumMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fields = widgetTester.widgetList(find.byType(FieldWidget));

    expect(fields.length, 160);
  });

  testWidgets("Should return 576 fields widget on hard mode board",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
      columns: boardHardMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fields = widgetTester.widgetList(find.byType(FieldWidget));

    expect(fields.length, 576);
  });

  testWidgets(
      "Should return true if field [0][0] color change to grey when player revel the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();

    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [3][7] color change to grey when player revel the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();

    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(3 * boardEasyMode.columns + 7);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [7][7] color change to grey when player revel the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();

    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 100),
    );

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [0][0] remains gray even after being revealed in easy mode",
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [3][7] remains gray even after being revealed in easy mode",
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(3 * boardEasyMode.columns + 7);

    await widgetTester.pump(const Duration(seconds: 1));

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [7][7] remains gray even after being revealed in easy mode",
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 100),
    );

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [0][0] show a flag when player mark the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [3][7] show a flag when player mark the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(3 * boardEasyMode.columns + 7);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [7][7] show a flag when player mark the field easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("easy"),
      columns: boardHardMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [0][0] color change to grey when player revel the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester
        .pumpWidget(MaterialApp(home: GameScreen(board: boardMediumMode)));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [5][2] color change to grey when player revel the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester
        .pumpWidget(MaterialApp(home: GameScreen(board: boardMediumMode)));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(5 * boardMediumMode.columns + 2);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [9][15] color change to grey when player revel the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester
        .pumpWidget(MaterialApp(home: GameScreen(board: boardMediumMode)));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 100),
    );

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [0][0] remains gray even after being revealed in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [5][2] remains gray even after being revealed in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(5 * boardMediumMode.columns + 2);

    await widgetTester.pump(const Duration(seconds: 1));

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [9][15] remains gray even after being revealed in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 100),
    );

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [0][0] color change to grey when player revel the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester
        .pumpWidget(MaterialApp(home: GameScreen(board: boardHardMode)));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [11][18] color change to grey when player revel the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester
        .pumpWidget(MaterialApp(home: GameScreen(board: boardHardMode)));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(11 * boardHardMode.columns + 18);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [23][23] color change to grey when player revel the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardHardMode,
      columns: boardHardMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 1000),
    );

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [0][0] remains gray even after being revealed in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardHardMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [11][18] remains gray even after being revealed in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardHardMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(11 * boardHardMode.columns + 18);

    await widgetTester.pump(const Duration(seconds: 1));

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [23][23] remains gray even after being revealed in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardHardMode,
      columns: boardHardMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //revela fica cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    //desrevela deve continuar cinza
    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinderAfter = widgetTester.widget(fieldFinder) as FieldWidget;

    await widgetTester.pump(const Duration(seconds: 1));
    expect(fieldFinderAfter.color, equals(Colors.grey));
  });

  testWidgets(
      "Should return true if field [0][0] show a flag when player mark the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [5][2] show a flag when player mark the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(5 * boardMediumMode.columns + 2);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [9][15] show a flag when player mark the field medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
      columns: boardMediumMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [0][0] show a flag when player mark the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [11][18] show a flag when player mark the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(11 * boardHardMode.columns + 18);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return true if field [23][23] show a flag when player mark the field hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
      columns: boardHardMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.tap(fieldFinder);
    await widgetTester.pump(const Duration(milliseconds: 50));
    await widgetTester.tap(fieldFinder);

    await widgetTester.pump(const Duration(seconds: 1));

    await widgetTester.pump(const Duration(seconds: 1));
    expect(find.widgetWithIcon(FieldWidget, Icons.flag), findsOneWidget);
  });

  testWidgets(
      "Should return return findsNothing if the player removes the flag from a field [0][0] in easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

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
      "Should return return findsNothing if the player removes the flag from a field [3][7] in easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(3 * boardEasyMode.columns + 7);

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
      "Should return return findsNothing if the player removes the flag from a field [7][7] in easy mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: boardEasyMode,
      columns: boardEasyMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 100),
    );

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
      "Should return return findsNothing if the player removes the flag from a field [0][0] in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

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
      "Should return return findsNothing if the player removes the flag from a field [5][2] in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(5 * boardMediumMode.columns + 2);

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
      "Should return return findsNothing if the player removes the flag from a field [9][15] in medium mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("medium"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 100),
    );

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
      "Should return return findsNothing if the player removes the flag from a field [0][0] in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).first;

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
      "Should return return findsNothing if the player removes the flag from a field [11][18] in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder =
        find.byType(FieldWidget).at(11 * boardHardMode.columns + 18);

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
      "Should return return findsNothing if the player removes the flag from a field [23][23] in hard mode",
      (widgetTester) async {
    MenuEntity menu = MenuEntity();
    await widgetTester.pumpWidget(MaterialApp(
        home: GameScreen(
      board: menu.initGame("hard"),
      columns: boardHardMode.columns * 2,
    )));

    await widgetTester.pump(const Duration(seconds: 1));

    final fieldFinder = find.byType(FieldWidget).last;

    await widgetTester.pump(const Duration(seconds: 1));

    //Ajuda a rolar a tela para encontrar o widget que sera pressionado
    await widgetTester.dragUntilVisible(
      fieldFinder,
      find.byType(GridView),
      const Offset(0, 300),
    );

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
}
