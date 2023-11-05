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
  List<bool> bombsMarkedFlag;

  BoardEntity(
      {required this.fields,
      required this.lines,
      required this.columns,
      required this.flags,
      required this.bombs,
      required this.timer,
      required this.fieldsOpen,
      required this.bombsMarkedFlag});

  BoardEntity getBoard() {
    return BoardEntity(
        fields: fields,
        lines: lines,
        columns: columns,
        flags: flags,
        bombs: bombs,
        timer: timer,
        fieldsOpen: fieldsOpen,
        bombsMarkedFlag: bombsMarkedFlag);
  }

  String getGamemode() {
    if (bombs == 10) {
      return "Facil";
    } else if (bombs == 30) {
      return "Medio";
    } else {
      return "Dificil";
    }
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

  void createListOfBombsMarked() {
    bombsMarkedFlag = List<bool>.generate(lines * columns, (index) {
      return false;
    });
  }

  void verifyField(int line, int column) {
    int position = (line * columns + column);

    fieldsOpen[position] = true;
    fields[position].wasRevelated = true;

    if (line > 0) {
      if (fields[((line - 1) * columns) + column].hasBomb == false &&
          fieldsOpen[((line - 1) * columns) + column] == false) {
        if (fields[(line * columns + column)].neighboringPumps == 0) {
          verifyField(line - 1, column);
        }
      }
    }

    if (column > 0) {
      if (fields[(line * columns + (column - 1))].hasBomb == false &&
          fieldsOpen[(line * columns) + column - 1] == false) {
        if (fields[(line * columns + column)].neighboringPumps == 0) {
          verifyField(line, column - 1);
        }
      }
    }

    if (column < columns - 1) {
      if (fields[(line * columns + (column + 1))].hasBomb == false &&
          fieldsOpen[(line * columns) + column + 1] == false) {
        if (fields[(line * columns + column)].neighboringPumps == 0) {
          verifyField(line, column + 1);
        }
      }
    }

    if (line < lines - 1) {
      if (fields[((line + 1) * columns + column)].hasBomb == false &&
          fieldsOpen[((line + 1) * columns) + column] == false) {
        if (fields[(line * columns + column)].neighboringPumps == 0) {
          verifyField(line + 1, column);
        }
      }
    }
  }

  bool verifyIfFieldMarkedHasBomb(int position) {
    if (fields[position].hasBomb == true) {
      if (bombsMarkedFlag[position] == true) {
        bombsMarkedFlag[position] = false;
        return false;
      } else {
        bombsMarkedFlag[position] = true;
        return true;
      }
    } else {
      return false;
    }
  }

  int verifyNumberOfBombsMarkedWithFlag() {
    int numbombsMarked = 0;
    for (int c = 0; c < bombsMarkedFlag.length; c++) {
      if (bombsMarkedFlag[c] == true) {
        numbombsMarked++;
      }
    }

    return numbombsMarked;
  }

  int verifyNumberOfFieldsOpen() {
    int numberOfFieldsOpen = 0;
    for (int c = 0; c < fieldsOpen.length; c++) {
      if (fieldsOpen[c] == true) {
        numberOfFieldsOpen++;
      }
    }
    return numberOfFieldsOpen;
  }

  bool gamewin() {
    if (verifyNumberOfBombsMarkedWithFlag() == bombs &&
        verifyNumberOfFieldsOpen() == fields.length - bombs) {
      return true;
    } else {
      return false;
    }
  }
}
