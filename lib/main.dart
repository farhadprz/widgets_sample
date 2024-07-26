import 'package:flutter/material.dart';
import 'package:widgets_sample/home.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isMaterial3 = true;
  ThemeMode themeMode = ThemeMode.system;

  bool get isLightMode => switch (themeMode) {
        ThemeMode.system => View.of(context).platformDispatcher.platformBrightness == Brightness.light,
        ThemeMode.light => true,
        ThemeMode.dark => false
      };

  void toggleThemeMode() {
    setState(() {
      themeMode = isLightMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets Sample',
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: isMaterial3,
      ),
      home: Home(
        isMaterial3: isMaterial3,
      ),
    );
  }
}
