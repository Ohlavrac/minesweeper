import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:minesweeper/box.dart';
import 'package:minesweeper/domain/entities/history_entity.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';

import '../../widgets/custom_menu_button_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    HistoryEntity history = HistoryEntity();

    return Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            CustomMenuButtonWidget(
                title: "Apagar Historico",
                onPressed: () {
                  setState(() {
                    history.clearAllHistory();
                  });
                }),
          ],
        ),
        body: box.length == 0 ? const Center(child: Text("Historico Vazio", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),) : ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            var gameHistory = history.getGameHistory(index);
            return Card(
              child: ListTile(
                title:
                    Text("Game ${dateFormat.format(gameHistory.createdAt!)}"),
                subtitle: Text(
                    "Pontos: ${gameHistory.points} | Dificuldade: ${gameHistory.gamemode}"),
                trailing: Text(
                  gameHistory.win == true ? "Vitoria" : "Derrota",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:
                          gameHistory.win == true ? Colors.green : Colors.red),
                ),
              ),
            );
          },
        ));
  }
}
