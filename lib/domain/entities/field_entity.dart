import 'dart:math';

import 'board_entity.dart';

class FieldEntity {
  bool hasBomb;
  bool isChecked;
  bool wasRevelated;
  int neighboringPumps;

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

  void calculateNeibBombs(BoardEntity board, int count) {
    int line = board.getLineNumber(board.columns, count);
        int column = board.getColumnNumber(board.columns, count);

        if (line > 0 && column > 0) {
          if (board.fields[((line-1) * board.columns + (column-1))].hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }

        if (line > 0) {
          if (board.fields[((line - 1) * board.columns + column)].hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }

        if (line > 0 && column < board.columns - 1) {
          if (board.fields[((line - 1) * board.columns + (column + 1))].hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }

        if (column > 0) {
          if (board.fields[(line * board.columns + (column - 1))].hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }

        if (column < board.columns - 1) {
          if (board.fields[(line * board.columns + (column + 1))].hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }

        if (line < board.lines - 1 && column > 0) {
          if (board.fields[((line + 1) * board.columns + (column - 1))]
                  .hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }

        if (line < board.lines - 1) {
          if (board.fields[((line + 1) * board.columns + column)].hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }

        if (line < board.lines - 1 && column < board.columns - 1) {
          if (board.fields[((line + 1) * board.columns + (column + 1))]
                  .hasBomb) {
            board.fields[count].neighboringPumps++;
          }
        }
  }
}
