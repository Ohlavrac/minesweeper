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

    expect(field.markField(), false);
  });

  test("Should return generate 64 EntityFieds for easy mode", () {
    BoardEntity board =
        BoardEntity(fields: [], lines: 8, columns: 8, flags: 10, bombs: 10);
    expect(field.generateFields(board).length, 64);
  });

  test("Should return generate 100 EntityFieds for medium mode", () {
    BoardEntity board =
        BoardEntity(fields: [], lines: 10, columns: 16, flags: 30, bombs: 30);
    expect(field.generateFields(board).length, 160);
  });

  test("Should return generate 576 EntityFieds for hard mode", () {
    BoardEntity board =
        BoardEntity(fields: [], lines: 24, columns: 24, flags: 100, bombs: 100);
    expect(field.generateFields(board).length, 576);
  });
}
