import 'package:flutter/material.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/menu_entity.dart';
import 'package:minesweeper/ui/screens/game_screen/game_screen.dart';
import 'package:minesweeper/ui/screens/history_screen/history_screen.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';
import 'package:minesweeper/ui/shared/app_texts.dart';
import 'package:minesweeper/ui/widgets/custom_menu_button_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MenuEntity menu = MenuEntity();

    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CustomMenuButtonWidget(
              title: "Historico",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HistoryScreen()));
              }),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                "UltraMegaMineSweeper",
                style: AppText.title,
              ),
            ),
            CustomMenuButtonWidget(
                title: "FACIL",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(
                              board: menu.initGame("easy"),
                            )),
                  );
                }),
            CustomMenuButtonWidget(
                title: "MEDIO",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(
                              board: menu.initGame("medium"),
                            )),
                  );
                }),
            CustomMenuButtonWidget(
                title: "DIFICIL",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(
                              board: menu.initGame("hard"),
                            )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
