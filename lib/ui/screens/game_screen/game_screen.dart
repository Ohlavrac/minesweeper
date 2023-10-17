import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';
import 'package:minesweeper/ui/shared/app_texts.dart';
import 'package:minesweeper/ui/widgets/field_widget.dart';

class GameScreen extends StatefulWidget {
  final BoardEntity board;
  const GameScreen({super.key, required this.board});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Timer timer;
  int start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          start++;
        });
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //INVES DE USAR O NUMERO MAXIMO DE BANDEIRA POSSO USAR O NUMERO MAXIMO DE BOMBAS
    int maxValue = widget.board.bombs;
    bool gamerunning = true;
    widget.board.timer = start;
    Color fieldColor = Colors.blue;

    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Container(
          child: Text(
            "${widget.board.timer}",
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
                  "${widget.board.flags}",
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
              crossAxisCount: widget.board.columns,
            ),
            itemBuilder: (context, position) {
              if (widget.board.fieldsOpen[position] == true) {
                fieldColor = Colors.grey;
              } else {
                fieldColor = Colors.blue;
              }
              return FieldWidget(
                color: fieldColor,
                onTap: () {
                  setState(() {
                    if (widget.board.checkIfHasFlag(position)) {
                      if (widget.board.reveleField(position)) {
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
                        int line = widget.board
                            .getLineNumber(widget.board.columns, position);
                        int column = widget.board
                            .getColumnNumber(widget.board.columns, position);

                        setState(() {
                          widget.board.verifyField(line, column);
                        });
                      }
                    } else {}
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    print(
                        "${widget.board.fields[position].isChecked == false} | ${widget.board.flags != 0} | ${widget.board.fields[position].wasRevelated}");
                    if (widget.board.fields[position].isChecked == false &&
                        widget.board.flags != 0 &&
                        widget.board.fields[position].wasRevelated != true) {
                      widget.board.verifyIfFieldMarkedHasBomb(position);
                      widget.board.verifyNumberOfBombsMarkedWithFlag();
                      widget.board.fields[position].markField();
                      widget.board.removeFlagFromCounter(maxValue);
                      if (widget.board.verifyNumberOfBombsMarkedWithFlag() ==
                          widget.board.bombs) {
                        print("FIM DE JOGO GANHO");
                      }
                      //print(widget.board.bombsMarkedFlag);
                    } else if (widget.board.fields[position].isChecked ==
                            true &&
                        widget.board.flags < maxValue) {
                      widget.board.addFlagInTheCounter(maxValue);
                      widget.board.fields[position].removeFieldMark();
                    }
                    print(
                        "${widget.board.fields[position].isChecked == false} | ${widget.board.flags != 0} | ${widget.board.fields[position].wasRevelated}");
                  });
                },
                flag: widget.board.fields[position].isChecked == false
                    ? widget.board.fields[position].neighboringPumps > 0 &&
                            widget.board.fields[position].wasRevelated == true
                        ? Center(
                            child: Text(
                                "${widget.board.fields[position].neighboringPumps}"),
                          )
                        : Container()
                    : const Center(
                        child: Icon(
                          Icons.flag,
                          color: Colors.red,
                        ),
                      ),
              );
            },
            itemCount: widget.board.lines * widget.board.columns,
          ),
        ),
      ),
    );
  }
}
