import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';

void main() {
  FieldEntity field = FieldEntity(
      hasBomb: false,
      isChecked: false,
      wasRevelated: false,
      neighboringPumps: 0);
  test("Should return a field with a bomb", () {
    FieldEntity field = FieldEntity(
        hasBomb: true,
        isChecked: false,
        wasRevelated: false,
        neighboringPumps: 0);
    expect(field.hasBomb, true);
  });

  test("Should return a field without a bomb", () {
    FieldEntity field = FieldEntity(
        hasBomb: false,
        isChecked: false,
        wasRevelated: false,
        neighboringPumps: 0);
    expect(field.hasBomb, false);
  });

  test("Should return a field with a flag (is checked)", () {
    FieldEntity field = FieldEntity(
        hasBomb: true,
        isChecked: true,
        wasRevelated: false,
        neighboringPumps: 0);
    expect(field.isChecked, true);
  });

  test("Should remove the flag from the field", () {
    FieldEntity field = FieldEntity(
        hasBomb: true,
        isChecked: true,
        wasRevelated: false,
        neighboringPumps: 0);

    expect(field.removeFieldMark(), false);
  });

  test("Should return generate 64 EntityFieds for easy mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    expect(field.generateFields(board).length, 64);
  });

  test("Should return generate 100 EntityFieds for medium mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 10, columns: 16, flags: 30, bombs: 30, timer: 0);
    expect(field.generateFields(board).length, 160);
  });

  test("Should return generate 576 EntityFieds for hard mode", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 24, columns: 24, flags: 100, bombs: 100, timer: 0);
    expect(field.generateFields(board).length, 576);
  });

  //VERIFICAR SE POSSO TESTAR OS ESTREMOS DE CADA TIPO DE TABULEIRO JA QUE DEPENDENDO CADA CAMPO DA BORDA PODE TER ENTRE 0 E 5 BOMBAS
  
  test("Should return 0 if the field dont have nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 0;
    expect(board.fields[7].neighboringPumps, 0);
  });

  test("Should return 1 if the field have 1 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 1;
    expect(board.fields[7].neighboringPumps, 1);
  });

  test("Should return 2 if the field have 2 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 2;
    expect(board.fields[7].neighboringPumps, 2);
  });

  test("Should return 3 if the field have 3 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 3;
    expect(board.fields[7].neighboringPumps, 3);
  });

  test("Should return 4 if the field have 4 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 4;
    expect(board.fields[7].neighboringPumps, 4);
  });

  test("Should return 5 if the field have 5 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 0;
    expect(board.fields[7].neighboringPumps, 0);
  });

  test("Should return 6 if the field have 6 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 6;
    expect(board.fields[7].neighboringPumps, 6);
  });

  test("Should return 7 if the field have 7 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 7;
    expect(board.fields[7].neighboringPumps, 7);
  });

  test("Should return 8 if the field have 8 nearby bombs", () {
    BoardEntity board = BoardEntity(
        fields: [], lines: 8, columns: 8, flags: 10, bombs: 10, timer: 0);
    field.generateFields(board);
    board.fields[7].neighboringPumps = 8;
    expect(board.fields[7].neighboringPumps, 8);
  });
}
