import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tictactoe/common/styles.dart';
import 'package:tictactoe/game_mode.dart';

class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({this.title = ""});

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
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "TIC",
                        style: kTextStyle1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "TAC",
                        style: kTextStyle1.copyWith(color: Colors.purple),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "TOE",
                        style: kTextStyle1.copyWith(color: Colors.blueAccent),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          GameMode.gameModeRoute,
                        );
                      },
                      child: Text('Let\'s Play'))
                ],
              ),
            ),
          )),
    );
  }
}
