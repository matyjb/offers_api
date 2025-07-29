import 'package:flutter/material.dart';
import 'package:offers/presentation/screens/home/home.dart';
import 'package:offers/presentation/screens/login/login.dart';

class RouteNames {
  static const String home = "/home";
  static const String login = "/login";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => switch (settings.name) {
        RouteNames.home => const HomeScreen(),
        RouteNames.login => const LoginScreen(),
        _ => const Scaffold(body: Text("404 route not found")),
      },
      settings: RouteSettings(arguments: settings.arguments),
    );
  }
}
