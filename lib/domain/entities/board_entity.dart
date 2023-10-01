import 'package:minesweeper/domain/entities/field_entity.dart';

class BoardEntity {
  final List<FieldEntity> fields;
  final int lines;
  final int columns;

  BoardEntity(this.fields, this.lines, this.columns);

  BoardEntity getBoard() {
    return BoardEntity(fields, lines, columns);
  }
}
