import 'package:flutter/material.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';
import 'package:minesweeper/ui/shared/app_texts.dart';
import 'package:minesweeper/ui/widgets/custom_menu_button_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text("UltraMegaMineSweeper", style: AppText.title,),
            ),
            CustomMenuButtonWidget(title: "FACIL", onPressed: () {}),
            CustomMenuButtonWidget(title: "MEDIO", onPressed: () {}),
            CustomMenuButtonWidget(title: "DIFICIL", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
