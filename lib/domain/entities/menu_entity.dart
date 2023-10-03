import 'package:minesweeper/domain/entities/board_entity.dart';

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
    if (gamemode.toLowerCase() == "easy") {
      return BoardEntity(fields: [],lines: 8,columns: 8, flags: 10, bombs: 10);
    } else if (gamemode.toLowerCase() == "medium") {
      return BoardEntity(fields: [],lines: 10,columns: 16, flags: 30, bombs: 30);
    } else {
      return BoardEntity(fields: [],lines: 24,columns: 24, flags: 100, bombs: 100);
    }
  }
}
