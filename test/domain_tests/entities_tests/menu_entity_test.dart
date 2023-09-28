import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/domain/entities/menu_entity.dart';

void main() {
  test("Should return EASY when user select easy mode", () {
    MenuEntity menu = MenuEntity();
    int option = 1;
    expect(menu.selectGameMode(option), "easy");
  });

  test("Should return MEDIUM when user select medium mode", () {
    MenuEntity menu = MenuEntity();
    int option = 2;
    expect(menu.selectGameMode(option), "medium");
  });

  test("Should return HARD when user select hard mode", () {
    MenuEntity menu = MenuEntity();
    int option = 3;
    expect(menu.selectGameMode(option), "hard");
  });

  test("Should return ERROR when user select outher mode", () {
    MenuEntity menu = MenuEntity();
    int option = 55;
    expect(menu.selectGameMode(option), "error");
  });
}