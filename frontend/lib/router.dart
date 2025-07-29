import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offers/presentation/screens/home/home.dart';
import 'package:offers/presentation/screens/login/login.dart';

class RouteNames {
  static const String home = "/home";
  static const String login = "/login";
}

class AppRouter {
  Route<T> _buildRoute<T>(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(builder: (_) => screen, settings: settings);
  }

  Route _buildNotFoundRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text("404 - Page not found"))),
      settings: settings,
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RouteNames.home => _buildRoute(settings, const HomeScreen()),
      RouteNames.login => _buildRoute<User?>(settings, const LoginScreen()),
      _ => _buildNotFoundRoute(settings),
    };
  }
}
