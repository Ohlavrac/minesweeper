import 'package:flutter/material.dart';
import 'package:minesweeper/ui/screens/game_screen/game_screen.dart';
import 'package:minesweeper/ui/screens/menu_screen/menu_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/menu",
      routes: {
        "/menu" : (context) => const MenuScreen(),
        "/game" : (context) => const GameScreen(),
      },
    );
  }
}
