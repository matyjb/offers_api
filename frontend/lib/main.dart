import 'package:flutter/material.dart';
import 'package:offers/constants.dart';
import 'package:offers/providers.dart';
import 'package:offers/router.dart';

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
    return BlocProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: RouteNames.home,
      ),
    );
  }
}

