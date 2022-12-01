import 'package:flutter/material.dart';
import 'package:tictactoe/single_player_mode.dart';

import 'common/styles.dart';

class GameMode extends StatefulWidget {
  static const gameModeRoute = '/gameModeRoute';
  const GameMode({
    super.key,
  });

  @override
  State<GameMode> createState() => _GameModeState();
}

class _GameModeState extends State<GameMode> {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.only(top: topPadding),
          decoration: const BoxDecoration(gradient: kGradient1),
          alignment: Alignment.center,
          child: Align(
            alignment: Alignment.topCenter,
            child:
                // SingleChildScrollView(
                //   child:
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        "Select Game",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.orange, width: 2)),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Single Player",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   height: 40,
                          // ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(.7),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.purple, width: 2)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SinglePlayer.singlePlayerRoute);
                              },
                              child: const Text(
                                "Two Players",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   height: 40,
                          // ),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: const Text(
                          //     "Market Place",
                          //     style: TextStyle(fontSize: 30),
                          //   ),
                          // ),
                          // // const SizedBox(
                          // //   height: 40,
                          // // ),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: const Text(
                          //     "Challenges",
                          //     style: TextStyle(fontSize: 30),
                          //   ),
                          // ),
                          // // const SizedBox(
                          // //   height: 40,
                          // // ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
        //),
      ),
    );
  }
}
