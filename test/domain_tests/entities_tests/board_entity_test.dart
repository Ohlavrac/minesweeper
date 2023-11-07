import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';
import 'package:minesweeper/domain/entities/menu_entity.dart';
import 'package:minesweeper/domain/errors/flags_error.dart';

void main() {
  FieldEntity fieldEntity = FieldEntity(
      hasBomb: false,
      isChecked: false,
      wasRevelated: false,
      neighboringPumps: 0);

  BoardEntity boardEasyMode = BoardEntity(
      fields: [],
      lines: 8,
      columns: 8,
      flags: 10,
      bombs: 10,
      timer: 0,
      fieldsOpen: [],
      bombsMarkedFlag: []);

  BoardEntity boardMediumMode = BoardEntity(
      fields: [],
      lines: 10,
      columns: 16,
      flags: 30,
      bombs: 30,
      timer: 0,
      fieldsOpen: [],
      bombsMarkedFlag: []);

  BoardEntity boardHardMode = BoardEntity(
      fields: [],
      lines: 24,
      columns: 24,
      flags: 100,
      bombs: 100,
      timer: 0,
      fieldsOpen: [],
      bombsMarkedFlag: []);

  test("Should return a board line for EASY mode", () {
    expect(boardEasyMode.getBoard().lines, 8);
  });

  test("Should return a board column for EASY mode", () {
    expect(boardEasyMode.getBoard().columns, 8);
  });

  test("Should return a board line for MEDIUM mode", () {
    expect(boardMediumMode.getBoard().lines, 10);
  });

  test("Should return a board column for MEDIUM mode", () {
    expect(boardMediumMode.getBoard().columns, 16);
  });

  test("Should return a board line for HARD mode", () {
    expect(boardHardMode.getBoard().lines, 24);
  });

  test("Should return a board column for HARD mode", () {
    expect(boardHardMode.getBoard().columns, 24);
  });

  test("Should remove flag from the counter", () {
    expect(boardEasyMode.removeFlagFromCounter(10), "9");
  });

  test("Should add flag from the counter", () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 8,
        columns: 8,
        flags: 9,
        bombs: 10,
        timer: 0,
        fieldsOpen: [],
        bombsMarkedFlag: []);

    expect(board.addFlagInTheCounter(10), "10");
  });

  test("Should return FlagsCounterEmptyError if flags counter equals to 0", () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 8,
        columns: 8,
        flags: 0,
        bombs: 10,
        timer: 0,
        fieldsOpen: [],
        bombsMarkedFlag: []);

    expect(board.removeFlagFromCounter(10),
        FlagsError.flagsCounterEmptyError.name);
  });

  test("Should return FlagsCounterEmptyError if flags counter minus tan to 0",
      () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 8,
        columns: 8,
        flags: -1,
        bombs: 10,
        timer: 0,
        fieldsOpen: [],
        bombsMarkedFlag: []);

    expect(board.removeFlagFromCounter(10),
        FlagsError.flagsCounterEmptyError.name);
  });

  test("Should return FlagsCounterIsFull if flags counter max to limit", () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 8,
        columns: 8,
        flags: 11,
        bombs: 10,
        timer: 0,
        fieldsOpen: [],
        bombsMarkedFlag: []);

    expect(board.addFlagInTheCounter(10), FlagsError.flagsCounterIsFull.name);
  });

  test("Should return timer with 0 secs when game start", () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 8,
        columns: 8,
        flags: 11,
        bombs: 10,
        timer: 0,
        fieldsOpen: [],
        bombsMarkedFlag: []);
    expect(board.timer, 0);
  });

  test("Should return line and column of a select field", () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 8,
        columns: 8,
        flags: 11,
        bombs: 10,
        timer: 0,
        fieldsOpen: [],
        bombsMarkedFlag: []);

    fieldEntity.generateFields(board);
    int lineNumber = board.getLineNumber(board.columns, 5);
    int columnNumber = board.getColumnNumber(board.columns, 5);

    expect([lineNumber, columnNumber], [0, 5]);
  });

  test("Should return 64 fields from easy mode board", () {
    fieldEntity.generateFields(boardEasyMode);

    expect(boardEasyMode.fields.length, 64);
  });

  test("Should return 160 fields from medium mode board", () {
    fieldEntity.generateFields(boardMediumMode);

    expect(boardMediumMode.fields.length, 160);
  });

  test("Should return 576 fields from hard mode board", () {
    fieldEntity.generateFields(boardHardMode);

    expect(boardHardMode.fields.length, 576);
  });

  test("Should return 10 bombs from easy mode board", () {
    fieldEntity.generateFields(boardEasyMode);
    int numOfBombs = 0;

    for (int c = 0; c < boardEasyMode.fields.length; c++) {
      if (boardEasyMode.fields[c].hasBomb == true) {
        numOfBombs++;
      }
    }

    expect(numOfBombs, 10);
  });

  test("Should return 30 bombs from medium mode board", () {
    fieldEntity.generateFields(boardMediumMode);
    int numOfBombs = 0;

    for (int c = 0; c < boardMediumMode.fields.length; c++) {
      if (boardMediumMode.fields[c].hasBomb == true) {
        numOfBombs++;
      }
    }

    expect(numOfBombs, 30);
  });

  test("Should return 100 bombs from hard mode board", () {
    fieldEntity.generateFields(boardHardMode);
    int numOfBombs = 0;

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].hasBomb == true) {
        numOfBombs++;
      }
    }

    expect(numOfBombs, 100);
  });

  test("Should return 64 undercoverd fields when board start easy mode", () {
    fieldEntity.generateFields(boardHardMode);
    int numberOfUndiscoveredFields = 0;

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].wasRevelated == false) {
        numberOfUndiscoveredFields++;
      }
    }

    expect(numberOfUndiscoveredFields, boardHardMode.fields.length);
  });

  test("Should return 160 undercoverd fields when board start medium mode", () {
    fieldEntity.generateFields(boardHardMode);
    int numberOfUndiscoveredFields = 0;

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].wasRevelated == false) {
        numberOfUndiscoveredFields++;
      }
    }

    expect(numberOfUndiscoveredFields, boardHardMode.fields.length);
  });

  test("Should return 576 undercoverd fields when board start hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    int numberOfUndiscoveredFields = 0;

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].wasRevelated == false) {
        numberOfUndiscoveredFields++;
      }
    }

    expect(numberOfUndiscoveredFields, boardHardMode.fields.length);
  });

  test("Should return 64 easy mode fields not marked with a flag", () {
    fieldEntity.generateFields(boardEasyMode);
    int numberOfUnmarkedFields = 0;

    for (int c = 0; c < boardEasyMode.fields.length; c++) {
      if (boardEasyMode.fields[c].isChecked == false) {
        numberOfUnmarkedFields++;
      }
    }

    expect(numberOfUnmarkedFields, boardEasyMode.fields.length);
  });

  test("Should return 160 medium mode fields not marked with a flag", () {
    fieldEntity.generateFields(boardMediumMode);
    int numberOfUnmarkedFields = 0;

    for (int c = 0; c < boardMediumMode.fields.length; c++) {
      if (boardMediumMode.fields[c].isChecked == false) {
        numberOfUnmarkedFields++;
      }
    }

    expect(numberOfUnmarkedFields, boardMediumMode.fields.length);
  });

  test("Should return 576 hard mode fields not marked with a flag", () {
    fieldEntity.generateFields(boardHardMode);
    int numberOfUnmarkedFields = 0;

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].isChecked == false) {
        numberOfUnmarkedFields++;
      }
    }

    expect(numberOfUnmarkedFields, boardHardMode.fields.length);
  });

  test("Should return false when player try revel a fild with a flag", () {
    fieldEntity.generateFields(boardEasyMode);

    boardEasyMode.fields[5].isChecked = true;

    expect(boardEasyMode.checkIfHasFlag(5), false);
  });

  test("Should return true when player select a field with a bomb", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.fields[5].hasBomb = true;

    expect(boardEasyMode.reveleField(5), true);
  });

  test("Should return false when player select a field without a bomb", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.fields[5].hasBomb = false;

    expect(boardEasyMode.reveleField(5), false);
  });

  test("Should return 64 values false in openFields on easy mode board", () {
    boardEasyMode.createListOpenFields();
    int fieldsOpenCount = 0;

    for (int c = 0; c < boardEasyMode.fieldsOpen.length; c++) {
      if (boardEasyMode.fieldsOpen[c] == false) {
        fieldsOpenCount++;
      }
    }
    expect(fieldsOpenCount, 64);
  });

  test("Should return 160 values false in openFields on medium mode board", () {
    boardMediumMode.createListOpenFields();
    int fieldsOpenCount = 0;

    for (int c = 0; c < boardMediumMode.fieldsOpen.length; c++) {
      if (boardMediumMode.fieldsOpen[c] == false) {
        fieldsOpenCount++;
      }
    }
    expect(fieldsOpenCount, 160);
  });

  test("Should return 576 values false in openFields on hard mode board", () {
    boardHardMode.createListOpenFields();
    int fieldsOpenCount = 0;

    for (int c = 0; c < boardHardMode.fieldsOpen.length; c++) {
      if (boardHardMode.fieldsOpen[c] == false) {
        fieldsOpenCount++;
      }
    }
    expect(fieldsOpenCount, 576);
  });

  test("Should return 10 when all bombs are marked with flags in easy mode",
      () {
    fieldEntity.generateFields(boardEasyMode);

    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    for (int c = 0; c < boardEasyMode.fields.length; c++) {
      if (boardEasyMode.fields[c].hasBomb == true) {
        boardEasyMode.verifyIfFieldMarkedHasBomb(c);
      }
    }

    expect(boardEasyMode.verifyNumberOfBombsMarkedWithFlag(), 10);
  });

  test("Should return 30 when all bombs are marked with flags in medium mode",
      () {
    fieldEntity.generateFields(boardMediumMode);

    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    for (int c = 0; c < boardMediumMode.fields.length; c++) {
      if (boardMediumMode.fields[c].hasBomb == true) {
        boardMediumMode.verifyIfFieldMarkedHasBomb(c);
      }
    }

    expect(boardMediumMode.verifyNumberOfBombsMarkedWithFlag(), 30);
  });

  test("Should return 100 when all bombs are marked with flags in hard mode",
      () {
    fieldEntity.generateFields(boardHardMode);

    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].hasBomb == true) {
        boardHardMode.verifyIfFieldMarkedHasBomb(c);
      }
    }

    expect(boardHardMode.verifyNumberOfBombsMarkedWithFlag(), 100);
  });

  test("Should return 10 flags in the counter when game start in easy mode",
      () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 8,
        columns: 8,
        flags: 10,
        bombs: 10,
        timer: 0,
        fieldsOpen: [],
        bombsMarkedFlag: []);

    expect(board.flags, 10);
  });

  test("Should return 30 flags in the counter when game start in medium mode",
      () {
    expect(boardMediumMode.flags, 30);
  });

  test("Should return 100 flags in the counter when game start in hard mode",
      () {
    expect(boardHardMode.flags, 100);
  });

  test("Should return 54 discovered fields in easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    for (int c = 0; c < boardEasyMode.fields.length; c++) {
      if (boardEasyMode.fields[c].hasBomb == false) {
        boardEasyMode.verifyField(
            (c / boardEasyMode.columns).floor(), c % boardEasyMode.columns);
      }
    }
    expect(boardEasyMode.verifyNumberOfFieldsOpen(), 54);
  });

  test("Should return 130 discovered fields in medium mode", () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    for (int c = 0; c < boardMediumMode.fields.length; c++) {
      if (boardMediumMode.fields[c].hasBomb == false) {
        boardMediumMode.verifyField(
            (c / boardMediumMode.columns).floor(), c % boardMediumMode.columns);
      }
    }
    expect(boardMediumMode.verifyNumberOfFieldsOpen(), 130);
  });

  test("Should return 476 discovered fields in hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].hasBomb == false) {
        boardHardMode.verifyField(
            (c / boardHardMode.columns).floor(), c % boardHardMode.columns);
      }
    }
    expect(boardHardMode.verifyNumberOfFieldsOpen(), 476);
  });

  test("Shoul return true when game win on easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    for (int c = 0; c < boardEasyMode.fields.length; c++) {
      if (boardEasyMode.fields[c].hasBomb == false) {
        boardEasyMode.verifyField(
            (c / boardEasyMode.columns).floor(), c % boardEasyMode.columns);
      }

      if (boardEasyMode.fields[c].hasBomb == true) {
        boardEasyMode.verifyIfFieldMarkedHasBomb(c);
      }
    }

    expect(boardEasyMode.gamewin(), true);
  });

  test("Shoul return true when game win on medium mode", () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    for (int c = 0; c < boardMediumMode.fields.length; c++) {
      if (boardMediumMode.fields[c].hasBomb == false) {
        boardMediumMode.verifyField(
            (c / boardMediumMode.columns).floor(), c % boardMediumMode.columns);
      }

      if (boardMediumMode.fields[c].hasBomb == true) {
        boardMediumMode.verifyIfFieldMarkedHasBomb(c);
      }
    }

    expect(boardMediumMode.gamewin(), true);
  });

  test("Shoul return true when game win on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    for (int c = 0; c < boardHardMode.fields.length; c++) {
      if (boardHardMode.fields[c].hasBomb == false) {
        boardHardMode.verifyField(
            (c / boardHardMode.columns).floor(), c % boardHardMode.columns);
      }

      if (boardHardMode.fields[c].hasBomb == true) {
        boardHardMode.verifyIfFieldMarkedHasBomb(c);
      }
    }

    expect(boardHardMode.gamewin(), true);
  });

  test("Should return true when player try revel field 1 on easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.verifyField(0, 0);
    expect(boardEasyMode.fieldsOpen[0], true);
  });

  test("Should return true when player try revel field 31 on easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.verifyField(3, 7);
    expect(boardEasyMode.fieldsOpen[31], true);
  });

  test("Should return true when player try revel field 63 on easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.verifyField(7, 7);
    expect(boardEasyMode.fieldsOpen[63], true);
  });

  test("Should return true when player try revel field 1 on mediun mode", () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.verifyField(0, 0);
    expect(boardMediumMode.fieldsOpen[0], true);
  });

  test("Should return true when player try revel field 82 on mediun mode", () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.verifyField(5, 2);
    expect(boardMediumMode.fieldsOpen[82], true);
  });

  test("Should return true when player try revel field 159 on mediun mode", () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.verifyField(9, 15);
    expect(boardMediumMode.fieldsOpen[159], true);
  });

  test("Should return true when player try revel field 1 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.verifyField(0, 0);
    expect(boardHardMode.fieldsOpen[0], true);
  });

  test("Should return true when player try revel field 288 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.verifyField(12, 0);
    expect(boardHardMode.fieldsOpen[288], true);
  });

  test("Should return true when player try revel field 575 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.verifyField(23, 23);
    expect(boardHardMode.fieldsOpen[575], true);
  });

  test("Should return true when the player tries to flag field 1 in easy mode",
      () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.fields[0].hasBomb = false;
    boardEasyMode.fields[0].markField();
    expect(boardEasyMode.fields[0].isChecked, true);
  });

  test("Should return true when the player tries to flag field 31 in easy mode",
      () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.fields[31].hasBomb = false;
    boardEasyMode.fields[31].markField();
    expect(boardEasyMode.fields[31].isChecked, true);
  });

  test("Should return true when the player tries to flag field 63 in easy mode",
      () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.fields[63].hasBomb = false;
    boardEasyMode.fields[63].markField();
    expect(boardEasyMode.fields[63].isChecked, true);
  });

  test(
      "Should return true when the player tries to flag field 1 in medium mode",
      () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.fields[0].hasBomb = false;
    boardMediumMode.fields[0].markField();
    expect(boardMediumMode.fields[0].isChecked, true);
  });

  test(
      "Should return true when the player tries to flag field 82 in medium mode",
      () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.fields[82].hasBomb = false;
    boardMediumMode.fields[82].markField();
    expect(boardMediumMode.fields[82].isChecked, true);
  });

  test(
      "Should return true when the player tries to flag field 159 in medium mode",
      () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.fields[159].hasBomb = false;
    boardMediumMode.fields[159].markField();
    expect(boardMediumMode.fields[159].isChecked, true);
  });

  test("Should return true when player try revel field 1 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.fields[0].hasBomb = false;
    boardHardMode.fields[0].markField();
    expect(boardHardMode.fields[0].isChecked, true);
  });

  test("Should return true when player try revel field 288 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.fields[288].hasBomb = false;
    boardHardMode.fields[288].markField();
    expect(boardHardMode.fields[288].isChecked, true);
  });

  test("Should return true when player try revel field 575 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.fields[575].hasBomb = false;
    boardHardMode.fields[575].markField();
    expect(boardHardMode.fields[575].isChecked, true);
  });

  test("Should return true when player try unrevel field 1 on easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.fields[0].hasBomb = false;
    boardEasyMode.fields[0].markField(); //revela o campo
    boardEasyMode.fields[0].markField(); //"desrevela" o campo
    expect(boardEasyMode.fields[0].isChecked, true);
  });

  test("Should return true when player try unrevel field 32 on easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.fields[32].hasBomb = false;
    boardEasyMode.fields[32].markField(); //revela o campo
    boardEasyMode.fields[32].markField(); //"desrevela" o campo
    expect(boardEasyMode.fields[32].isChecked, true);
  });

  test("Should return true when player try unrevel field 64 on easy mode", () {
    fieldEntity.generateFields(boardEasyMode);
    boardEasyMode.createListOfBombsMarked();
    boardEasyMode.createListOpenFields();

    boardEasyMode.fields[63].hasBomb = false;
    boardEasyMode.fields[63].markField(); //revela o campo
    boardEasyMode.fields[63].markField(); //"desrevela" o campo
    expect(boardEasyMode.fields[63].isChecked, true);
  });

  test("Should return true when player try unrevel field 1 on medium mode", () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.fields[0].hasBomb = false;
    boardMediumMode.fields[0].markField(); //revela o campo
    boardMediumMode.fields[0].markField(); //"desrevela" o campo
    expect(boardMediumMode.fields[0].isChecked, true);
  });

  test("Should return true when player try unrevel field 82 on medium mode",
      () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.fields[82].hasBomb = false;
    boardMediumMode.fields[82].markField(); //revela o campo
    boardMediumMode.fields[82].markField(); //"desrevela" o campo
    expect(boardMediumMode.fields[82].isChecked, true);
  });

  test("Should return true when player try unrevel field 159 on medium mode",
      () {
    fieldEntity.generateFields(boardMediumMode);
    boardMediumMode.createListOfBombsMarked();
    boardMediumMode.createListOpenFields();

    boardMediumMode.fields[159].hasBomb = false;
    boardMediumMode.fields[159].markField(); //revela o campo
    boardMediumMode.fields[159].markField(); //"desrevela" o campo
    expect(boardMediumMode.fields[159].isChecked, true);
  });

  test("Should return true when player try unrevel field 1 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.fields[0].hasBomb = false;
    boardHardMode.fields[0].markField(); //revela o campo
    boardHardMode.fields[0].markField(); //"desrevela" o campo
    expect(boardHardMode.fields[0].isChecked, true);
  });

  test("Should return true when player try unrevel field 288 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.fields[288].hasBomb = false;
    boardHardMode.fields[288].markField(); //revela o campo
    boardHardMode.fields[288].markField(); //"desrevela" o campo
    expect(boardHardMode.fields[288].isChecked, true);
  });

  test("Should return true when player try unrevel field 575 on hard mode", () {
    fieldEntity.generateFields(boardHardMode);
    boardHardMode.createListOfBombsMarked();
    boardHardMode.createListOpenFields();

    boardHardMode.fields[275].hasBomb = false;
    boardHardMode.fields[275].markField(); //revela o campo
    boardHardMode.fields[275].markField(); //"desrevela" o campo
    expect(boardHardMode.fields[275].isChecked, true);
  });

  test("Should return 64 fields on easy board", () {
    expect(fieldEntity.generateFields(boardEasyMode).length, 64);
  });

  test("Should return 160 fields on medium board", () {
    expect(fieldEntity.generateFields(boardMediumMode).length, 160);
  });

  test("Should return 576 fields on hard board", () {
    expect(fieldEntity.generateFields(boardHardMode).length, 576);
  });

  test("Should return false if the board is not without bombs in easy mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("easy");
    int numberofbombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numberofbombs++;
      }
    }

    expect(numberofbombs == 0, false);
  });

  test("Should return false if the board has more than 10 bombs in easy mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("easy");
    int numberofbombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numberofbombs++;
      }
    }

    expect(numberofbombs > 10, false);
  });

  test("Should return false if the board is not without bombs in medium mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("medium");
    int numberofbombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numberofbombs++;
      }
    }

    expect(numberofbombs == 0, false);
  });

  test("Should return false if the board has more than 30 bombs in medium mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("medium");
    int numberofbombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numberofbombs++;
      }
    }

    expect(numberofbombs > 30, false);
  });

  test("Should return false if the board is not without bombs in hard mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("hard");
    int numberofbombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numberofbombs++;
      }
    }

    expect(numberofbombs == 0, false);
  });

  test("Should return false if the board has more than 100 bombs in hard mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("hard");
    int numberofbombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numberofbombs++;
      }
    }

    expect(numberofbombs > 100, false);
  });

  test(
      "Should return false if there is no flag on the counter when the game starts in easy mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("easy");

    expect(board.flags == 0, false);
  });

  test(
      "Should return false if the flag number is not greater than 10 in easy mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("easy");

    expect(board.flags > 10, false);
  });

  test(
      "Should return false if there is no flag on the counter when the game starts in medium mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("medium");

    expect(board.flags == 0, false);
  });

  test(
      "Should return false if the flag number is not greater than 30 in medium mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("medium");

    expect(board.flags > 30, false);
  });

  test(
      "Should return false if there is no flag on the counter when the game starts in hard mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("hard");

    expect(board.flags == 0, false);
  });

  test(
      "Should return false if the flag number is not greater than 100 in hard mode",
      () {
    MenuEntity menu = MenuEntity();
    BoardEntity board = menu.initGame("hard");

    expect(board.flags > 100, false);
  });

  test("Should return false if the easy mode board has no lines", () {
    expect(boardEasyMode.getBoard().lines == 0, false);
  });

  test("Should return false if the easy mode board has more than 8 lines", () {
    expect(boardEasyMode.getBoard().lines > 8, false);
  });

  test("Should return false if the easy mode board has no columns", () {
    expect(boardEasyMode.getBoard().columns == 0, false);
  });

  test("Should return false if the easy mode board has more than 8 columns", () {
    expect(boardEasyMode.getBoard().columns > 8, false);
  });

  test("Should return false if the medium mode board has no lines", () {
    expect(boardMediumMode.getBoard().lines == 0, false);
  });

  test("Should return false if the medium mode board has more than 10 lines", () {
    expect(boardMediumMode.getBoard().lines > 10, false);
  });

  test("Should return false if the medium mode board has no columns", () {
    expect(boardMediumMode.getBoard().columns == 0, false);
  });

  test("Should return false if the medium mode board has more than 16 columns", () {
    expect(boardMediumMode.getBoard().columns > 16, false);
  });

  test("Should return false if the hard mode board has no lines", () {
    expect(boardHardMode.getBoard().lines == 0, false);
  });

  test("Should return false if the hard mode board has more than 24 lines", () {
    expect(boardHardMode.getBoard().lines > 24, false);
  });

  test("Should return false if the hard mode board has no columns", () {
    expect(boardHardMode.getBoard().columns == 0, false);
  });

  test("Should return false if the hard mode board has more than 24 columns", () {
    expect(boardHardMode.getBoard().columns > 24, false);
  });
}
