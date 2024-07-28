import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/color_image_button_widget.dart';
import 'package:widgets_sample/widgets/color_seed_button_widget.dart';
import 'package:widgets_sample/widgets/material_button_widget.dart';
import 'package:widgets_sample/widgets/navigation_transition_widget.dart';
import 'package:widgets_sample/widgets/theme_button_widget.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.isMaterial3,
    required this.colorSelected,
    required this.imageSelected,
    required this.colorSelectionMethod,
    required this.toggleThemeMode,
    required this.changeMaterialVersion,
    required this.handleColorSelect,
    required this.handleImageSelect,
  });

  final bool isMaterial3;
  final ColorSeed colorSelected;
  final ColorImageProvider imageSelected;
  final ColorSelectionMethod colorSelectionMethod;

  final void Function() toggleThemeMode;
  final void Function() changeMaterialVersion;
  final void Function(int) handleColorSelect;
  final void Function(int) handleImageSelect;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NavigationTransitionWidget(
      scaffoldKey: scaffoldKey,
      appBar: createAppBar(),
      body: const SizedBox(),
      navigationBar: const SizedBox(),
    );
  }

  PreferredSizeWidget createAppBar() => AppBar(
        title: widget.isMaterial3 ? const Text('Material 3') : const Text('Material 2'),
        actions: [
          ThemeButtonWidget(toggleThemeMode: widget.toggleThemeMode),
          MaterialButtonWidget(changeMaterialVersion: widget.changeMaterialVersion),
          ColorSeedButtonWidget(
            handleColorSelect: widget.handleColorSelect,
            colorSelected: widget.colorSelected,
            colorSelectionMethod: widget.colorSelectionMethod,
          ),
          ColorImageButtonWidget(
            handleImageSelect: widget.handleImageSelect,
            imageSelected: widget.imageSelected,
            colorSelectionMethod: widget.colorSelectionMethod,
          ),
        ],
      );
}
