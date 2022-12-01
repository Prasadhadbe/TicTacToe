import 'package:flutter/material.dart';

import 'home_page.dart';
import 'router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tic Tac Toe'),
      onGenerateRoute: (RouteSettings settings) =>
          router.Router.generateRoute(settings),
    );
  }
}
