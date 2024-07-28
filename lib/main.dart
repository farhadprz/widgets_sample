import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
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
  ColorSeed colorSelected = ColorSeed.baseColor;
  ColorImageProvider imageSelected = ColorImageProvider.leaves;
  ColorSelectionMethod colorSelectionMethod = ColorSelectionMethod.colorSeed;

  bool get isLightMode => switch (themeMode) {
        ThemeMode.system => View.of(context).platformDispatcher.platformBrightness == Brightness.light,
        ThemeMode.light => true,
        ThemeMode.dark => false
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets Sample',
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: isMaterial3,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: isMaterial3,
        brightness: Brightness.dark,
      ),
      home: Home(
        isMaterial3: isMaterial3,
        colorSelected: colorSelected,
        imageSelected: imageSelected,
        colorSelectionMethod: colorSelectionMethod,
        toggleThemeMode: () {
          setState(() {
            themeMode = isLightMode ? ThemeMode.dark : ThemeMode.light;
          });
        },
        changeMaterialVersion: () {
          setState(() {
            isMaterial3 = !isMaterial3;
          });
        },
        handleColorSelect: (value) {
          setState(() {
            colorSelectionMethod = ColorSelectionMethod.colorSeed;
            colorSelected = ColorSeed.values[value];
          });
        },
        handleImageSelect: (value) {
          setState(() {
            colorSelectionMethod = ColorSelectionMethod.image;
            imageSelected = ColorImageProvider.values[value];
          });
        },
      ),
    );
  }
}
