class MenuEntity {
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
}
