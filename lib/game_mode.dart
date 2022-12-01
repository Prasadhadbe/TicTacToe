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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
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
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, SinglePlayer.singlePlayerRoute);
                    },
                    child: const Text(
                      "Single Player",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Text("Two Player"),
                  Text("Market Place"),
                  Text("Challenges"),
                ]),
          )),
    );
  }
}
