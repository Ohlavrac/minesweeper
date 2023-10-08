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
  test("Should return a board line for EASY mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);

    expect(board.getBoard().lines, 8);
  });

  test("Should return a board column for EASY mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);

    expect(board.getBoard().columns, 8);
  });

  test("Should return a board line for MEDIUM mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 10, columns: 16, flags: 30, bombs: 30, timer: 0);

    expect(board.getBoard().lines, 10);
  });

  test("Should return a board column for MEDIUM mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 10, columns: 16, flags: 30, bombs: 30, timer: 0);

    expect(board.getBoard().columns, 16);
  });

  test("Should return a board line for HARD mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    expect(board.getBoard().lines, 24);
  });

  test("Should return a board column for HARD mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    expect(board.getBoard().columns, 24);
  });

  test("Should remove flag from the counter", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);

    expect(board.removeFlagFromCounter(10), "9");
  });

  test("Should add flag from the counter", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 9, bombs: 10, timer: 0);

    expect(board.addFlagInTheCounter(10), "10");
  });

  test("Should return FlagsCounterEmptyError if flags counter equals to 0", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 0, bombs: 10, timer: 0);

    expect(board.removeFlagFromCounter(10),
        FlagsError.flagsCounterEmptyError.name);
  });

  test("Should return FlagsCounterEmptyError if flags counter minus tan to 0",
      () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: -1, bombs: 10, timer: 0);

    expect(board.removeFlagFromCounter(10),
        FlagsError.flagsCounterEmptyError.name);
  });

  test("Should return FlagsCounterIsFull if flags counter max to limit", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 11, bombs: 10, timer: 0);

    expect(board.addFlagInTheCounter(10), FlagsError.flagsCounterIsFull.name);
  });

  test("Should return timer with 0 secs when game start", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 11, bombs: 10, timer: 0);
    expect(board.timer, 0);
  });

  test("Should return line and column of a select field", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 11, bombs: 10, timer: 0);
    fieldEntity.generateFields(board);
    int lineNumber = board.getLineNumber(board.columns, 5);
    int columnNumber = board.getColumnNumber(board.columns, 5);

    expect([lineNumber, columnNumber], [0, 5]);
  });

  test("Should return 64 fields from easy mode board", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);

    fieldEntity.generateFields(board);

    expect(board.fields.length, 64);
  });

  test("Should return 160 fields from medium mode board", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 10, columns: 16, flags: 30, bombs: 30, timer: 0);

    fieldEntity.generateFields(board);

    expect(board.fields.length, 160);
  });

  test("Should return 576 fields from hard mode board", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);

    expect(board.fields.length, 576);
  });

  test("Should return 10 bombs from easy mode board", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);

    fieldEntity.generateFields(board);
    int numOfBombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numOfBombs++;
      }
    }

    expect(numOfBombs, 10);
  });

  test("Should return 30 bombs from medium mode board", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 10, columns: 16, flags: 30, bombs: 30, timer: 0);

    fieldEntity.generateFields(board);
    int numOfBombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numOfBombs++;
      }
    }

    expect(numOfBombs, 30);
  });

  test("Should return 100 bombs from hard mode board", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);
    int numOfBombs = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].hasBomb == true) {
        numOfBombs++;
      }
    }

    expect(numOfBombs, 100);
  });

  test("Should return 64 undercoverd fields when board start easy mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);
    int numberOfUndiscoveredFields = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].wasRevelated == false) {
        numberOfUndiscoveredFields++;
      }
    }

    expect(numberOfUndiscoveredFields, board.fields.length);
  });

  test("Should return 160 undercoverd fields when board start medium mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);
    int numberOfUndiscoveredFields = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].wasRevelated == false) {
        numberOfUndiscoveredFields++;
      }
    }

    expect(numberOfUndiscoveredFields, board.fields.length);
  });

  test("Should return 576 undercoverd fields when board start hard mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);
    int numberOfUndiscoveredFields = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].wasRevelated == false) {
        numberOfUndiscoveredFields++;
      }
    }

    expect(numberOfUndiscoveredFields, board.fields.length);
  });

  test("Should return 64 easy mode fields not marked with a flag", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);
    int numberOfUnmarkedFields = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].isChecked == false) {
        numberOfUnmarkedFields++;
      }
    }

    expect(numberOfUnmarkedFields, board.fields.length);
  });

  test("Should return 160 medium mode fields not marked with a flag", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);
    int numberOfUnmarkedFields = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].isChecked == false) {
        numberOfUnmarkedFields++;
      }
    }

    expect(numberOfUnmarkedFields, board.fields.length);
  });

  test("Should return 576 hard mode fields not marked with a flag", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);

    fieldEntity.generateFields(board);
    int numberOfUnmarkedFields = 0;

    for (int c = 0; c < board.fields.length; c++) {
      if (board.fields[c].isChecked == false) {
        numberOfUnmarkedFields++;
      }
    }

    expect(numberOfUnmarkedFields, board.fields.length);
  });
}
