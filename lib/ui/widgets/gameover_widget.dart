import 'package:flutter/material.dart';

class GameOverWidget extends StatelessWidget {
  final Function()? onPressed;
  const GameOverWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("FIM DE JOGO"),
      content: const Text("Vocé pisou em uma mina."),
      actions: [
        ElevatedButton(
            onPressed: onPressed, child: const Text("Jogar Novamente"))
      ],
    );
  }
}