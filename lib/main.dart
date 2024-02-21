import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/app.dart';
import 'presentation/navigation/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const url = 'https://fqmirgdqwcvffjnfinko.supabase.co';
  const anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZxbWlyZ2Rxd2N2ZmZqbmZpbmtvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY4ODEwMjQsImV4cCI6MjAyMjQ1NzAyNH0.Hvb-RSyijVrgYIh3fSezHtFWbnp8i4t-znJJCL-Z6fw';
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
    authOptions:
        const FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasRegistered = prefs.getBool('isCompleted') ?? false;
  String initialRoute = hasRegistered
      ? NavigationRoutesName.homeScreen
      : NavigationRoutesName.introQuizPage;
  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}
