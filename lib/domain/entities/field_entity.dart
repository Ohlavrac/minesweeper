class FieldEntity {
  final bool hasBomb;
  final bool isChecked;
  final bool wasRevelated;
  final int neighboringPumps;

  FieldEntity(this.hasBomb, this.isChecked, this.wasRevelated, this.neighboringPumps);
}
