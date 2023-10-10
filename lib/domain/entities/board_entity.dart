import 'package:minesweeper/domain/entities/field_entity.dart';
import 'package:minesweeper/domain/errors/flags_error.dart';

class BoardEntity {
  List<FieldEntity> fields;
  final int lines;
  final int columns;
  int bombs;
  int flags;
  int timer;
  List<bool> fieldsOpen;

  BoardEntity(
      {required this.fields,
      required this.lines,
      required this.columns,
      required this.flags,
      required this.bombs,
      required this.timer,
      required this.fieldsOpen});

  BoardEntity getBoard() {
    return BoardEntity(
        fields: fields,
        lines: lines,
        columns: columns,
        flags: flags,
        bombs: bombs,
        timer: timer,
        fieldsOpen: fieldsOpen);
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

  int getLineNumber(int column, int position) {
    return (position / columns).floor();
  }

  int getColumnNumber(int column, int position) {
    return (position % columns);
  }

  bool checkIfHasFlag(int position) {
    if (fields[position].isChecked == true) {
      return false;
    } else {
      return true;
    }
  }

  bool reveleField(int position) {
    if (fields[position].hasBomb == true) {
      return true;
    } else {
      return false;
    }
  }

  void createListOpenFields() {
    fieldsOpen = List<bool>.generate(lines * columns, (index) {
      return false;
    });
  }
}
