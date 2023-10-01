import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';

void main() {
  test("Should return a board line for EASY mode", () {
    BoardEntity board = BoardEntity([], 8, 8);

    expect(board.getBoard().lines, 8);
  });

  test("Should return a board column for EASY mode", () {
    BoardEntity board = BoardEntity([], 8, 8);

    expect(board.getBoard().columns, 8);
  });

  test("Should return a board line for MEDIUM mode", () {
    BoardEntity board = BoardEntity([], 10, 16);

    expect(board.getBoard().lines, 10);
  });

  test("Should return a board column for MEDIUM mode", () {
    BoardEntity board = BoardEntity([], 10, 16);

    expect(board.getBoard().columns, 16);
  });

  test("Should return a board line for HARD mode", () {
    BoardEntity board = BoardEntity([], 24, 24);

    expect(board.getBoard().lines, 24);
  });

  test("Should return a board column for HARD mode", () {
    BoardEntity board = BoardEntity([], 24, 24);

    expect(board.getBoard().columns, 24);
  });
}