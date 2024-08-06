import 'dart:ui';

import 'package:flutter/material.dart';

const double mediumWidthBreakpoint = 1000;
const double largeWidthBreakpoint = 1500;

const double transitionLength = 500;

const colDivider = SizedBox(height: 10);
const rowDivider = SizedBox(width: 20);

const tinySpacing = 3.0;
const smallSpacing = 10.0;
const double cardWidth = 115;
const double widthConstraint = 450;

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

const List<Widget> exampleBarDestinations = [
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.explore_outlined),
    selectedIcon: Icon(Icons.explore),
    label: 'Explore',
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.pets_outlined),
    selectedIcon: Icon(Icons.pets),
    label: 'Pets',
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.account_box_outlined),
    selectedIcon: Icon(Icons.account_box),
    label: 'Account',
  ),
];

List<Widget> barWithBadgeDestinations = [
  NavigationDestination(
    icon: Badge.count(count: 1000, child: const Icon(Icons.mail_outline)),
    label: 'Mail',
    tooltip: '',
    selectedIcon: Badge.count(count: 1000, child: const Icon(Icons.mail)),
  ),
  const NavigationDestination(
    icon: Badge(label: Text('10'), child: Icon(Icons.chat_bubble_outline)),
    label: 'Chat',
    tooltip: '',
    selectedIcon: Badge(label: Text('10'), child: Icon(Icons.chat_bubble)),
  ),
  const NavigationDestination(
    icon: Badge(child: Icon(Icons.group_outlined)),
    label: 'Rooms',
    tooltip: '',
    selectedIcon: Badge(child: Icon(Icons.group_rounded)),
  ),
  NavigationDestination(
    icon: Badge.count(count: 3, child: const Icon(Icons.videocam_outlined)),
    label: 'Meet',
    tooltip: '',
    selectedIcon: Badge.count(count: 3, child: const Icon(Icons.videocam)),
  ),
];

final List<NavigationRailDestination> navRailDestinations = bottomNavigationBarItems
    .map<NavigationRailDestination>(
      (destination) => NavigationRailDestination(
        icon: Tooltip(
          message: destination.label,
          child: destination.icon,
        ),
        selectedIcon: Tooltip(
          message: destination.label,
          child: destination.selectedIcon,
        ),
        label: Text(destination.label),
      ),
    )
    .toList();
