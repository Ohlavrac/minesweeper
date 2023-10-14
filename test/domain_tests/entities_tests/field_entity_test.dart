import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';

void main() {
  FieldEntity field = FieldEntity(
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
      fieldsOpen: []);

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
    expect(field.generateFields(boardEasyMode).length, 64);
  });

  test("Should return generate 100 EntityFieds for medium mode", () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 10,
        columns: 16,
        flags: 30,
        bombs: 30,
        timer: 0,
        fieldsOpen: []);
    expect(field.generateFields(board).length, 160);
  });

  test("Should return generate 576 EntityFieds for hard mode", () {
    BoardEntity board = BoardEntity(
        fields: [],
        lines: 24,
        columns: 24,
        flags: 100,
        bombs: 100,
        timer: 0,
        fieldsOpen: []);
    expect(field.generateFields(board).length, 576);
  });

  //VERIFICAR SE POSSO TESTAR OS ESTREMOS DE CADA TIPO DE TABULEIRO JA QUE DEPENDENDO CADA CAMPO DA BORDA PODE TER ENTRE 0 E 5 BOMBAS

  test("Should return 0 if the field dont have nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 0;
    expect(boardEasyMode.fields[7].neighboringPumps, 0);
  });

  test("Should return 1 if the field have 1 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 1;
    expect(boardEasyMode.fields[7].neighboringPumps, 1);
  });

  test("Should return 2 if the field have 2 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 2;
    expect(boardEasyMode.fields[7].neighboringPumps, 2);
  });

  test("Should return 3 if the field have 3 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 3;
    expect(boardEasyMode.fields[7].neighboringPumps, 3);
  });

  test("Should return 4 if the field have 4 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 4;
    expect(boardEasyMode.fields[7].neighboringPumps, 4);
  });

  test("Should return 5 if the field have 5 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 0;
    expect(boardEasyMode.fields[7].neighboringPumps, 0);
  });

  test("Should return 6 if the field have 6 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 6;
    expect(boardEasyMode.fields[7].neighboringPumps, 6);
  });

  test("Should return 7 if the field have 7 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 7;
    expect(boardEasyMode.fields[7].neighboringPumps, 7);
  });

  test("Should return 8 if the field have 8 nearby bombs", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[7].neighboringPumps = 8;
    expect(boardEasyMode.fields[7].neighboringPumps, 8);
  });

  //Test das bombas vizinhas no modo facil (Cantos)

  test(
      "Should return 0 if the field [0][0] dont have nearby bombs on easy mode",
      () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 0);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 0)].neighboringPumps,
        0);
  });

  test("Should return 1 if the field [0][0] have nearby bombs on easy mode",
      () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(0 * boardEasyMode.columns + 1)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 0);
    field.calculateNeibBombs(boardEasyMode, 0);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 0)].neighboringPumps,
        1);
  });

  test("Should return 2 if the field [0][0] have nearby bombs on easy mode", () {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(0 * boardEasyMode.columns + 1)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 0)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 0);
    field.calculateNeibBombs(boardEasyMode, 0);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 0)].neighboringPumps,
        2);
  });

  test("Should return 3 if the field [0][0] have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(0 * boardEasyMode.columns + 1)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 0)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 1)].hasBomb = true;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 0);
    field.calculateNeibBombs(boardEasyMode, 0);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 0)].neighboringPumps,
        3);
  });

  test("Should return 0 if the field [0][7] dont have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].hasBomb = false;
    boardEasyMode.fields[(0 * boardEasyMode.columns + 6)].hasBomb = false;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 6)].hasBomb = false;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 7)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 7);
    field.calculateNeibBombs(boardEasyMode, 7);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].neighboringPumps,
        0);
  });

  test("Should return 1 if the field [0][7] have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].hasBomb = false;
    boardEasyMode.fields[(0 * boardEasyMode.columns + 6)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 6)].hasBomb = false;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 7)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 7);
    field.calculateNeibBombs(boardEasyMode, 7);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].neighboringPumps,
        1);
  });

  test("Should return 2 if the field [0][7] have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].hasBomb = false;
    boardEasyMode.fields[(0 * boardEasyMode.columns + 6)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 6)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 7)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 7);
    field.calculateNeibBombs(boardEasyMode, 7);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].neighboringPumps,
        2);
  });

  test("Should return 3 if the field [0][7] have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].hasBomb = false;
    boardEasyMode.fields[(0 * boardEasyMode.columns + 6)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 6)].hasBomb = true;
    boardEasyMode.fields[(1 * boardEasyMode.columns + 7)].hasBomb = true;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(0, 7);
    field.calculateNeibBombs(boardEasyMode, 7);
    expect(
        boardEasyMode.fields[(0 * boardEasyMode.columns + 7)].neighboringPumps,
        3);
  });

  test("Should return 0 if the field [7][0] dont have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(7 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(7, 0);
    field.calculateNeibBombs(boardEasyMode, 56);
    expect(
        boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].neighboringPumps,
        0);
  });

  test("Should return 1 if the field [7][0] have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 0)].hasBomb = true;
    boardEasyMode.fields[(7 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(7, 0);
    field.calculateNeibBombs(boardEasyMode, 56);
    expect(
        boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].neighboringPumps,
        1);
  });

  test("Should return 2 if the field [7][0] have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 0)].hasBomb = true;
    boardEasyMode.fields[(7 * boardEasyMode.columns + 1)].hasBomb = true;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 1)].hasBomb = false;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(7, 0);
    field.calculateNeibBombs(boardEasyMode, 56);
    expect(
        boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].neighboringPumps,
        2);
  });

  test("Should return 3 if the field [7][0] have nearby bombs on easy mode",() {
    field.generateFields(boardEasyMode);
    boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].hasBomb = false;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 0)].hasBomb = true;
    boardEasyMode.fields[(7 * boardEasyMode.columns + 1)].hasBomb = true;
    boardEasyMode.fields[(6 * boardEasyMode.columns + 1)].hasBomb = true;
    boardEasyMode.createListOpenFields();
    boardEasyMode.verifyField(7, 0);
    field.calculateNeibBombs(boardEasyMode, 56);
    expect(
        boardEasyMode.fields[(7 * boardEasyMode.columns + 0)].neighboringPumps,
        3);
  });

  test(
      "Should return 0 if the field [7][7] dont have nearby bombs on easy mode",
      () {});

  test("Should return 1 if the field [7][7] have nearby bombs on easy mode",
      () {});

  test("Should return 2 if the field [7][7] have nearby bombs on easy mode",
      () {});

  test("Should return 3 if the field [7][7] have nearby bombs on easy mode",
      () {});

  //Test das bombas vizinhas no modo medio (Cantos)

  //Test das bombas vizinhas no modo dificil (Cantos)
}
