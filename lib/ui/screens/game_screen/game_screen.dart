import 'package:flutter/material.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/field_entity.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';
import 'package:minesweeper/ui/shared/app_texts.dart';
import 'package:minesweeper/ui/widgets/field_widget.dart';

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
    bool gamerunning = true;

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
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: board.columns,
            ),
            itemBuilder: (context, position) {
              int lineNumber = board.getLineNumber(board.columns, position);
              int columnNumber = board.getColumnNumber(board.columns, position);

              return FieldWidget(
                onTap: () {
                  setState(() {
                    if (board.checkIfHasFlag(position)) {
                      if (board.reveleField(position)) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("FIM DE JOGO"),
                                content: const Text("Vocé pisou em uma mina."),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, "/menu");
                                      },
                                      child: const Text("Voltar para o menu"))
                                ],
                              );
                            });
                      } else {
                        print("Nada acontece");
                      }
                    } else {}
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    if (board.fields[position].isChecked == false &&
                        board.flags != 0) {
                      board.fields[position].markField();
                      board.removeFlagFromCounter(maxValue);
                    } else if (board.fields[position].isChecked == true &&
                        board.flags < maxValue) {
                      board.addFlagInTheCounter(maxValue);
                      board.fields[position].removeFieldMark();
                    }
                  });
                },
                flag: board.fields[position].isChecked == false
                    ? Container()
                    : const Icon(
                        Icons.flag,
                        color: Colors.red,
                      ),
              );
            },
            itemCount: board.lines * board.columns,
          ),
        ),
      ),
    );
  }
}
