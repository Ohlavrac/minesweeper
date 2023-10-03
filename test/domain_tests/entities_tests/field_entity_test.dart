import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';

void main() {
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
}
