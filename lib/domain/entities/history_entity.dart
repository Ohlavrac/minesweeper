import 'package:hive/hive.dart';
import 'package:minesweeper/box.dart';
part 'history_entity.g.dart';

@HiveType(typeId: 1)
class HistoryEntity {
  @HiveField(0)
  int? points;

  @HiveField(1)
  String? gamemode;

  @HiveField(2)
  DateTime? createdAt;

  @HiveField(3)
  bool? win;

  HistoryEntity({this.points, this.gamemode, this.createdAt, this.win});

  void saveGameHistory(HistoryEntity history) {
    box.put("game$createdAt", history);
  }

  HistoryEntity getGameHistory(int index) {
    return box.getAt(index);
  }

  void clearAllHistory() {
    box.clear();
  }
}
