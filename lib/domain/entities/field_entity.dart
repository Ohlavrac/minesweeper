import 'dart:math';

import 'board_entity.dart';

class FieldEntity {
  bool hasBomb;
  bool isChecked;
  final bool wasRevelated;
  final int neighboringPumps;

  FieldEntity(
      {required this.hasBomb,
      required this.isChecked,
      required this.wasRevelated,
      required this.neighboringPumps});

  bool markField() {
    isChecked = true;

    return isChecked;
  }

  bool removeFieldMark() {
    isChecked = false;

    return isChecked;
  }

  List<FieldEntity> generateFields(BoardEntity board) {
    board.fields = List.generate(board.lines * board.columns, (index) {
      return FieldEntity(
          hasBomb: false,
          isChecked: false,
          wasRevelated: false,
          neighboringPumps: 0);
    });

    for (int c = 0; c < board.bombs; c++) {
      var intValue = Random().nextInt(board.fields.length);
      if (board.fields[intValue].hasBomb == false) {
        board.fields[intValue].hasBomb = true;
      }
    }

    return board.fields;
  }
}
