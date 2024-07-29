import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/screens/color_palettes_screen.dart';
import 'package:widgets_sample/screens/components_screen.dart';
import 'package:widgets_sample/screens/elevations_screen.dart';
import 'package:widgets_sample/screens/typography_screen.dart';
import 'package:widgets_sample/widgets/color_image_button_widget.dart';
import 'package:widgets_sample/widgets/color_seed_button_widget.dart';
import 'package:widgets_sample/widgets/material_button_widget.dart';
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
  bool showMediumSizeLayout = false;
  bool showLargeSizeLayout = false;
  int screenIndex = SelectedScreen.component.value;

  @override
  void initState() {// Called just once, not in parent's setState and ...
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {// Called when properties changed: Properties are values passed
                                                  // to widgets to configure their behavior or appearance.
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() { // Called when dependencies changed(ex: rotate phone): Dependencies usually refer to
                                // data passed down from parent widgets to child widgets.
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    if(width > mediumWidthBreakpoint){
      if(width > largeWidthBreakpoint){
        showLargeSizeLayout = true;
        showMediumSizeLayout = false;
      }else {
        showLargeSizeLayout = false;
        showMediumSizeLayout = true;
      }
    }else {
      showLargeSizeLayout = false;
      showMediumSizeLayout = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Build Called');
    return Scaffold(
      appBar: getAppBar(),
      body: getScreen(SelectedScreen.values[screenIndex]),
      bottomNavigationBar: getNavigationBar(),
    );
  }

  PreferredSizeWidget getAppBar() => AppBar(
        title: widget.isMaterial3 ? const Text('Material 3') : const Text('Material 2'),
        actions: !(showMediumSizeLayout || showLargeSizeLayout) ? [
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
        ] : null,
      );

  NavigationBar? getNavigationBar() => !(showLargeSizeLayout || showMediumSizeLayout) ? NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: bottomNavigationBarItems,
      ) : null;

  Widget getScreen(SelectedScreen selectedScreen) => switch (selectedScreen) {
        SelectedScreen.component => const ComponentsScreen(),
        SelectedScreen.color => const ColorPalettesScreen(),
        SelectedScreen.typography => const TypographyScreen(),
        SelectedScreen.elevations => const ElevationsScreen(),
      };
}
