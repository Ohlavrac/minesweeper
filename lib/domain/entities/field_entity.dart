class FieldEntity {
  final bool hasBomb;
  bool isChecked;
  final bool wasRevelated;
  final int neighboringPumps;

  FieldEntity(
      {required this.hasBomb,
      required this.isChecked,
      required this.wasRevelated,
      required this.neighboringPumps});

  bool markField() {
    if (isChecked == false) {
      isChecked = true;
    } else {
      isChecked = false;
    }

    return isChecked;
  }
}
