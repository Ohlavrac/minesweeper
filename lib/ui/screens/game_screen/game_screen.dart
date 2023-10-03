import 'package:flutter/material.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';
import 'package:minesweeper/ui/shared/app_texts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    BoardEntity board =
        ModalRoute.of(context)!.settings.arguments as BoardEntity;

    //INVES DE USAR O NUMERO MAXIMO DE BANDEIRA POSSO USAR O NUMERO MAXIMO DE BOMBAS
    int maxValue = board.bombs;

    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Container(
          child: Text(
            "000",
            style: AppText.buttontitle,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.flag,
                  color: Colors.red,
                ),
                Text(
                  "${board.flags}",
                  style: AppText.buttontitle,
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Center(
          child: GridView.count(
            crossAxisCount: board.columns,
            children: List.generate(board.lines * board.columns, (index) {
              return GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    board.removeFlagFromCounter(maxValue);
                  });
                },
                onTap: () {
                  setState(() {
                    board.addFlagInTheCounter(maxValue);
                  });
                },
                child: Container(
                  height: 10,
                  width: 10,
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.black, width: 1)),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
