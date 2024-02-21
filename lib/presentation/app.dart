
import 'package:flutter/material.dart';

import 'navigation/routes.dart';


class MyApp extends StatelessWidget {
  final String initialRoute;
  static final mainNavigation = MainNavigation();
  const MyApp({super.key, required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes:  mainNavigation.routes,
      initialRoute: initialRoute,
      onGenerateRoute: mainNavigation.onGenerateRouteSetings,
    );
  }
}