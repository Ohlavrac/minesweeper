import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minesweeper/domain/entities/board_entity.dart';
import 'package:minesweeper/domain/entities/history_entity.dart';
import 'package:minesweeper/domain/entities/menu_entity.dart';
import 'package:minesweeper/ui/shared/app_colors.dart';
import 'package:minesweeper/ui/shared/app_texts.dart';
import 'package:minesweeper/ui/widgets/field_widget.dart';
import 'package:minesweeper/ui/widgets/gameover_widget.dart';
import 'package:minesweeper/ui/widgets/gamewin_widget.dart';

class GameScreen extends StatefulWidget {
  BoardEntity board;
  int? columns;
  GameScreen({super.key, required this.board, this.columns});

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
    int maxValue = widget.board.bombs;

    widget.board.timer = start;
    Color fieldColor = Colors.blue;
    MenuEntity menu = MenuEntity();

    HistoryEntity history = HistoryEntity();

    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
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
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.columns ?? widget.board.columns,
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
                        print("BOOOM");
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return GameOverWidget(
                                onPressed: () {
                                  history.saveGameHistory(
                                      widget.board.timer,
                                      widget.board.getGamemode(),
                                      DateTime.now(),
                                      false);
                                  widget.board =
                                      menu.initGame(widget.board.bombs == 10
                                          ? "easy"
                                          : widget.board.bombs == 30
                                              ? "medium"
                                              : "hard");
                                  Navigator.pop(context);
                                  start = 0;
                                },
                              );
                            });
                      } else {
                        int line = widget.board
                            .getLineNumber(widget.board.columns, position);
                        int column = widget.board
                            .getColumnNumber(widget.board.columns, position);
                        print("[${line}][${column}] = $position");
                        setState(() {
                          widget.board.verifyField(line, column);
                        });
                      }
                    }

                    if (widget.board.gamewin()) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return GameWinWidget(
                              onPressed: () {
                                history.saveGameHistory(
                                      widget.board.timer,
                                      widget.board.getGamemode(),
                                      DateTime.now(),
                                      true);
                                widget.board =
                                    menu.initGame(widget.board.bombs == 10
                                        ? "easy"
                                        : widget.board.bombs == 30
                                            ? "medium"
                                            : "hard");
                                Navigator.pop(context);
                                start = 0;
                              },
                            );
                          });
                    }
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    if (widget.board.fields[position].isChecked == false &&
                        widget.board.flags != 0 &&
                        widget.board.fields[position].wasRevelated != true) {
                      widget.board.verifyIfFieldMarkedHasBomb(position);
                      widget.board.verifyNumberOfBombsMarkedWithFlag();
                      widget.board.fields[position].markField();
                      widget.board.removeFlagFromCounter(maxValue);
                      print("ADD BANDEIRA");

                      if (widget.board.verifyNumberOfBombsMarkedWithFlag() ==
                              widget.board.bombs &&
                          widget.board.verifyNumberOfFieldsOpen() ==
                              widget.board.fields.length - widget.board.bombs) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return GameWinWidget(
                                onPressed: () {
                                  print("WIN");
                                  history.saveGameHistory(
                                      widget.board.timer,
                                      widget.board.getGamemode(),
                                      DateTime.now(),
                                      true);
                                  widget.board =
                                      menu.initGame(widget.board.bombs == 10
                                          ? "easy"
                                          : widget.board.bombs == 30
                                              ? "medium"
                                              : "hard");
                                  Navigator.pop(context);
                                  start = 0;
                                },
                              );
                            });
                      }
                    } else if (widget.board.fields[position].isChecked ==
                            true &&
                        widget.board.flags < maxValue) {
                      widget.board.addFlagInTheCounter(maxValue);
                      widget.board.fields[position].removeFieldMark();
                      print("REMOVE BANDEIRA");
                    }
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
