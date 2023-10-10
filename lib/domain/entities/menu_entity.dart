import 'dart:math';

import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';

class MenuEntity {
  final int points = 0;
  final int timer = 0;

  MenuEntity();

  String selectGameMode(int option) {
    if (option == 1) {
      return "easy";
    } else if (option == 2) {
      return "medium";
    } else if (option == 3) {
      return "hard";
    } else {
      return "error";
    }
  }

  BoardEntity createBoard(String gamemode) {
    BoardEntity board;
    FieldEntity field = FieldEntity(
      hasBomb: false,
      isChecked: false,
      wasRevelated: false,
      neighboringPumps: 0,
    );

    if (gamemode.toLowerCase() == "easy") {
      board = BoardEntity(
          fields: [],
          lines: 8,
          columns: 8,
          flags: 10,
          bombs: 10,
          timer: 0,
          fieldsOpen: []);
      field.generateFields(board);
      board.createListOpenFields();
      for (int count = 0; count < board.fields.length; count++) {
        field.calculateNeibBombs(board, count);
      }
      return board;
    } else if (gamemode.toLowerCase() == "medium") {
      board = BoardEntity(
          fields: [],
          lines: 10,
          columns: 16,
          flags: 30,
          bombs: 30,
          timer: 0,
          fieldsOpen: []);
      field.generateFields(board);
      board.createListOpenFields();
      for (int count = 0; count < board.fields.length; count++) {
        field.calculateNeibBombs(board, count);
      }
      return board;
    } else {
      board = BoardEntity(
          fields: [],
          lines: 24,
          columns: 24,
          flags: 100,
          bombs: 100,
          timer: 0,
          fieldsOpen: []);
      field.generateFields(board);
      board.createListOpenFields();
      for (int count = 0; count < board.fields.length; count++) {
        field.calculateNeibBombs(board, count);
      }
      return board;
    }
  }
}
