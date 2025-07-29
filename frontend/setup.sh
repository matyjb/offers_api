# appName=$(basename "$(pwd)")
appName="offers"

flutter pub add bloc flutter_bloc freezed_annotation json_annotation dev:build_runner dev:freezed dev:json_serializable

echo "import 'package:flutter/material.dart';
import 'package:$appName/constants.dart';
import 'package:$appName/router.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: RouteNames.home,
    );
  }
}
" > lib/main.dart

echo "import 'package:flutter/material.dart';
import 'package:$appName/presentation/screens/home/home.dart';

class RouteNames {
  static const String home = \"/home\";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => switch (settings.name) {
        RouteNames.home => const HomeScreen(),
        _ => const Scaffold(body: Text(\"404 route not found\"))
      },
      settings: RouteSettings(arguments: settings.arguments),
    );
  }
}
" > lib/router.dart

echo "const String appName = \"$appName\";
" > lib/constants.dart

mkdir lib/presentation lib/data lib/logic
mkdir lib/data/models lib/data/providers lib/data/repositories
mkdir lib/presentation/screens
mkdir lib/presentation/screens/home

echo "import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(\"home\"),
    );
  }
}
" > lib/presentation/screens/home/home.dart

echo "
analyzer:
  errors:
    invalid_annotation_target: ignore
  exclude:
  - lib/**/*.g.dart 
" >> analysis_options.yaml