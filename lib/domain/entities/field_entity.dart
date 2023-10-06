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
    int bombCount = 0;
    board.fields = List.generate(board.lines * board.columns, (index) {
      return FieldEntity(
          hasBomb: false,
          isChecked: false,
          wasRevelated: false,
          neighboringPumps: 0);
    });

    while (bombCount != board.bombs) {
      var intValue = Random().nextInt(board.fields.length);
      if (board.fields[intValue].hasBomb == false) {
        board.fields[intValue].hasBomb = true;
        bombCount++;
      } else {
        continue;
      }
    }

    return board.fields;
  }
}
