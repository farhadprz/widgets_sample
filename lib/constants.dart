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

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud('Cloud', Icons.cloud_outlined),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);

  final String label;
  final IconData icon;
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

class ExampleDestination {
  const ExampleDestination(
    this.label,
    this.icon,
    this.selectedIcon,
  );

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = [
  ExampleDestination('Inbox', Icon(Icons.inbox_outlined), Icon(Icons.inbox)),
  ExampleDestination('Outbox', Icon(Icons.send_outlined), Icon(Icons.send)),
  ExampleDestination('Favorites', Icon(Icons.favorite_outline), Icon(Icons.favorite)),
  ExampleDestination('Trash', Icon(Icons.delete_outline), Icon(Icons.delete)),
];

const List<ExampleDestination> labelDestination = [
  ExampleDestination('Family', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination('School', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination('Work', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
];

enum ColorItem {
  red('red', Colors.red),
  orange('orange', Colors.orange),
  yellow('yellow', Colors.yellow),
  green('green', Colors.green),
  blue('blue', Colors.blue),
  indigo('indigo', Colors.indigo),
  violet('violet', Color(0xFF8F00FF)),
  purple('purple', Colors.purple),
  pink('pink', Colors.pink),
  silver('silver', Color(0xFF808080)),
  gold('gold', Color(0xFFFFD700)),
  beige('beige', Color(0xFFF5F5DC)),
  brown('brown', Colors.brown),
  grey('grey', Colors.grey),
  black('black', Colors.black),
  white('white', Colors.white);

  const ColorItem(this.label, this.color);
  final String label;
  final Color color;
}