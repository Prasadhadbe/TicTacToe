import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/game_mode.dart';
import 'package:tictactoe/single_player_mode.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    String routeName = settings.name!;
    final List<String> args = settings.name!.split("/");
    if (args.length > 2) {
      routeName = "/${args[1]}";
    }

    switch (routeName) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => MainTabs());
      //   break;
      // case SplashScreen.splash:
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      //   break;

      // case ProductsList.productsRoute:
      //   return MaterialPageRoute(builder: (_) {
      //     return ProductsList(
      //       args: settings.arguments,
      //     );
      //   });
      //   break;
      case GameMode.gameModeRoute:
        return MaterialPageRoute(builder: (_) {
          return GameMode();
        });

      case SinglePlayer.singlePlayerRoute:
        return MaterialPageRoute(builder: (_) {
          return SinglePlayer();
        });

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
