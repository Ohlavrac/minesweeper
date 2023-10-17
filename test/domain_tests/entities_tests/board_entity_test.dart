import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';
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
}
