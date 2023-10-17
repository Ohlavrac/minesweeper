import 'package:flutter/material.dart';

class GameWinWidget extends StatelessWidget {
  final Function()? onPressed;
  const GameWinWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("JOGO GANHO"),
      content: const Text("Parabens você ganhou."),
      actions: [
        ElevatedButton(
            onPressed: onPressed, child: const Text("Jogar Novamente"))
      ],
    );
  }
}
