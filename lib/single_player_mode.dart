import 'package:flutter/material.dart';
import 'package:tictactoe/common/styles.dart';

class SinglePlayer extends StatefulWidget {
  static const singlePlayerRoute = '/singlePlayerRoute';
  const SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  @override
  bool oTurn = true;
  int boxesFilled = 0;
  List<String> displayElement = ["", "", "", "", "", "", "", "", ""];
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(gradient: kGradient1),
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Tic Tac Toe",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "${oTurn ? "O" : "X"} Turn",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: boxesFilled != 9
                                ? () {
                                    _tapped(index);
                                  }
                                : () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                child: Text(
                                  displayElement[index],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 35),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _clearAll();
                      },
                      child: const Text("Clear All"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _clearAll() {
    setState(() {
      displayElement = ["", "", "", "", "", "", "", "", ""];
      oTurn = true;
      boxesFilled = 0;
    });
  }

  _tapped(int index) {
    setState(() {
      if (oTurn && displayElement[index] == "") {
        boxesFilled++;
        displayElement[index] = "O";
      } else if (oTurn == false && displayElement[index] == "") {
        boxesFilled++;
        displayElement[index] = "X";
      }
      oTurn = !oTurn;
    });
    _checkWinner();
  }

  _checkWinner() {
    //checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[1] == displayElement[2] &&
        displayElement[0] != "") {
      _showWinnerDialog(winner: displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[4] == displayElement[5] &&
        displayElement[3] != "") {
      _showWinnerDialog(winner: displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[7] == displayElement[8] &&
        displayElement[6] != "") {
      _showWinnerDialog(winner: displayElement[6]);
    }

    //checking columns
    if (displayElement[0] == displayElement[3] &&
        displayElement[3] == displayElement[6] &&
        displayElement[0] != "") {
      _showWinnerDialog(winner: displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[4] == displayElement[7] &&
        displayElement[7] != "") {
      _showWinnerDialog(winner: displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[5] == displayElement[8] &&
        displayElement[2] != "") {
      _showWinnerDialog(winner: displayElement[2]);
    }

    //checking diagonals
    if (displayElement[0] == displayElement[4] &&
        displayElement[4] == displayElement[8] &&
        displayElement[0] != "") {
      _showWinnerDialog(winner: displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[4] == displayElement[6] &&
        displayElement[2] != "") {
      _showWinnerDialog(winner: displayElement[2]);
    } else if (boxesFilled == 9) {
      _showWinnerDialog();
    }
  }

  _showWinnerDialog({winner}) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: winner != null ? const Text('Winner') : Text("DRAW"),
              content: winner != null ? Text(winner) : null,
            ));
  }
}
