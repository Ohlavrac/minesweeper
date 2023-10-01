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
      return BoardEntity([], 8, 8);
    } else {
      return BoardEntity([], 24, 24);
    }
  }
}
