import 'package:flutter/material.dart';
import 'package:minesweeper/ui/screens/shared/app_colors.dart';
import 'package:minesweeper/ui/screens/shared/app_texts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("UltraMegaMineSweeper", style: AppText.title,),
          ElevatedButton(
            onPressed: () {

            },
            child: Text("FACIL"),
          )
        ],
      ),
    );
  }
}
