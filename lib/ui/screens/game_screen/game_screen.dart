import 'package:flutter/material.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    String gamemode = ModalRoute.of(context)!.settings.arguments as String;
    late BoardEntity board;

    if (gamemode == "easy") {
      board = BoardEntity([], 8, 8);
    } else if (gamemode == "medium") {
      board = BoardEntity([], 10, 16);
    } else {
      board = BoardEntity([], 24, 24);
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Center(
          child: GridView.count(
            crossAxisCount: board.columns,
            children: List.generate(board.lines * board.columns, (index) {
              return Container(child: Text("$index"), color: Colors.blue,);
            }),
          ),
        ),
      ),
    );
  }
}