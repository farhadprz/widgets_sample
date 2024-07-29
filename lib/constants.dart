import 'dart:ui';

import 'package:flutter/material.dart';

const int mediumWidthBreakpoint = 1000;
const int largeWidthBreakpoint = 1500;

enum ColorSelectionMethod {
  colorSeed,
  image,
}

enum ColorSeed {
  baseColor('M3 Baseline', Color(0xff6750a4)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);

  final String label;
  final Color color;
}

enum ColorImageProvider {
  leaves('Leaves', 'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png'),
  peonies('Peonies', 'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png'),
  bubbles('Bubbles', 'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png'),
  seaweed('Seaweed', 'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_4.png'),
  seagrapes(
      'Sea Grapes', 'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_5.png'),
  petals('Petals', 'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_6.png');

  const ColorImageProvider(this.label, this.url);

  final String label;
  final String url;
}

enum SelectedScreen {
  component(0),
  color(1),
  typography(2),
  elevations(3);

  const SelectedScreen(this.value);
  final int value;
}

const List<NavigationDestination> bottomNavigationBarItems = [
  NavigationDestination(
    icon: Icon(Icons.widgets_outlined),
    label: 'Component',
    tooltip: '',
    selectedIcon: Icon(Icons.widgets),
  ),
  NavigationDestination(
    icon: Icon(Icons.format_paint_outlined),
    label: 'Color',
    tooltip: '',
    selectedIcon: Icon(Icons.format_paint),
  ),
  NavigationDestination(
    icon: Icon(Icons.text_snippet_outlined),
    label: 'Typography',
    tooltip: '',
    selectedIcon: Icon(Icons.text_snippet),
  ),
  NavigationDestination(
    icon: Icon(Icons.invert_colors_on_outlined),
    label: 'Elevations',
    tooltip: '',
    selectedIcon: Icon(Icons.opacity),
  ),
];
