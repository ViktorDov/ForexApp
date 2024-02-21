import 'package:flutter/material.dart';
import 'package:forexstrategy/domain/entity/strategy.dart';
import 'package:forexstrategy/presentation/favorite/favorite_screen.dart';
import 'package:forexstrategy/presentation/home/home_screen.dart';
import 'package:forexstrategy/presentation/quiz/page/intro_page.dart';
import 'package:forexstrategy/presentation/quiz/page/last_page.dart';
import 'package:forexstrategy/presentation/quiz/page/quiz_page.dart';
import 'package:forexstrategy/presentation/strategy/strategy_page.dart';
import 'package:forexstrategy/presentation/strategyDetails/strategy_details.dart';

abstract class NavigationRoutesName {
  static const String introQuizPage = '/';
  static const String quizPage = '/quiz_page';
  static const String lastPage = '/quiz_page/last_page';
  static const String strategyPage = '/strategy_page';
  static const String favoriteScreen = '/favorite';
  static const String strategyDetails = '/strategy_page/strategy_details';
  static const String homeScreen = '/home_screen';
}

class MainNavigation {
  final initialRoute = NavigationRoutesName.introQuizPage;
  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoutesName.introQuizPage: (context) => const IntroQuizPage(),
    NavigationRoutesName.homeScreen: (context) => const HomeScreen(),
    NavigationRoutesName.quizPage: (context) => const QuizPageWidget(),
    NavigationRoutesName.lastPage: (context) => const LastPageWidget(),
    NavigationRoutesName.strategyPage: (context) => const StrategysPage(),
    NavigationRoutesName.favoriteScreen: (context) => const FavoriteScreen(),
  };

  Route<Object> onGenerateRouteSetings(RouteSettings settings) {
    switch (settings.name) {
      case (NavigationRoutesName.strategyDetails):
        final strategy = settings.arguments;
        return MaterialPageRoute(
          builder: (context) =>
              StrategyDetailsScreen(strategy: strategy as Strategy),
        );
      default:
        const widget =
            Text('Page not found. Try to restarting the application. :(');
        return MaterialPageRoute(
          builder: (context) => widget,
        );
    }
  }
}
