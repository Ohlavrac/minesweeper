import 'package:minesweeper/domain/entities/field_entity.dart';
import 'package:minesweeper/domain/errors/flags_error.dart';

class BoardEntity {
  List<FieldEntity> fields;
  final int lines;
  final int columns;
  int bombs;
  int flags;

  BoardEntity(
      {required this.fields,
      required this.lines,
      required this.columns,
      required this.flags,
      required this.bombs});

  BoardEntity getBoard() {
    return BoardEntity(
        fields: fields,
        lines: lines,
        columns: columns,
        flags: flags,
        bombs: bombs);
  }

  //MELHORAR ISSO
  String removeFlagFromCounter(int maxValue) {
    if (flags > 0 && flags <= maxValue) {
      flags = flags - 1;
      return flags.toString();
    } else {
      return FlagsError.flagsCounterEmptyError.name;
    }
  }

  String addFlagInTheCounter(int maxValue) {
    if (flags < maxValue) {
      flags = flags + 1;
      return flags.toString();
    } else {
      return FlagsError.flagsCounterIsFull.name;
    }
  }
}
