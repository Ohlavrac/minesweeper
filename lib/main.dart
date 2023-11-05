import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minesweeper/box.dart';
import 'package:minesweeper/domain/entities/history_entity.dart';
import 'package:minesweeper/myapp.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(HistoryEntityAdapter());
  box = await Hive.openBox<HistoryEntity>("gamehistory");
  print(box);
  runApp(const MyApp());
}
