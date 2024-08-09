import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/screens/color_palettes_screen.dart';
import 'package:widgets_sample/screens/components_screen.dart';
import 'package:widgets_sample/screens/elevations_screen.dart';
import 'package:widgets_sample/screens/typography_screen.dart';
import 'package:widgets_sample/transitions/navigation_transition.dart';
import 'package:widgets_sample/widgets/color_image_button_widget.dart';
import 'package:widgets_sample/widgets/color_seed_button_widget.dart';
import 'package:widgets_sample/widgets/expanded_trailing_actions/expanded_trailing_actions_widget.dart';
import 'package:widgets_sample/widgets/material_button_widget.dart';
import 'package:widgets_sample/widgets/navigation_bars_widget.dart';
import 'package:widgets_sample/widgets/theme_button_widget.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.isLightMode,
    required this.isMaterial3,
    required this.colorSelected,
    required this.imageSelected,
    required this.colorSelectionMethod,
    required this.toggleThemeMode,
    required this.changeMaterialVersion,
    required this.handleColorSelect,
    required this.handleImageSelect,
  });

  final bool isLightMode;
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController controller;
  late final CurvedAnimation railAnimation;
  bool controllerInitialized = false;
  bool showMediumSizeLayout = false;
  bool showLargeSizeLayout = false;

  int screenIndex = SelectedScreen.component.value;

  @override
  void initState() {
    // Called just once, not in parent's setState and ...
    super.initState();

    controller = AnimationController(
      value: 0,
      duration: Duration(milliseconds: transitionLength.toInt() * 2),
      vsync: this,
    );
    railAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(
          0.5, 1.0), // An animation that runs over the second half of the parent animation's total duration.
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    // Called when properties changed: Properties are values passed
    // to widgets to configure their behavior or appearance.
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // Called when dependencies changed(ex: rotate phone): Dependencies usually refer to
    // data passed down from parent widgets to child widgets.
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    final AnimationStatus status = controller.status;
    if (width > mediumWidthBreakpoint) {
      if (width > largeWidthBreakpoint) {
        showLargeSizeLayout = true;
        showMediumSizeLayout = false;
      } else {
        showLargeSizeLayout = false;
        showMediumSizeLayout = true;
      }
      if (status != AnimationStatus.forward && status != AnimationStatus.completed) {
        controller.forward();
      }
    } else {
      showLargeSizeLayout = false;
      showMediumSizeLayout = false;
      if (status != AnimationStatus.reverse && status != AnimationStatus.dismissed) {
        controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      controller.value = width > mediumWidthBreakpoint ? 1 : 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) => NavigationTransition(
        scaffoldKey: scaffoldKey,
        animationController: controller,
        railAnimation: railAnimation,
        navigationRail: NavigationRail(
          extended: showLargeSizeLayout,
          destinations: navRailDestinations,
          selectedIndex: screenIndex,
          onDestinationSelected: (index) {
            setState(() {
              screenIndex = index;
            });
          },
          trailing: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: showLargeSizeLayout
                  ? ExpandedTrailingActionsWidget(
                      toggleThemeMode: widget.toggleThemeMode,
                      changeMaterialVersion: widget.changeMaterialVersion,
                      handleColorSelect: widget.handleColorSelect,
                      handleImageSelect: widget.handleImageSelect,
                      isLightMode: widget.isLightMode,
                      isMaterial3: widget.isMaterial3,
                      imageSelected: widget.imageSelected,
                      colorSelected: widget.colorSelected,
                      colorSelectionMethod: widget.colorSelectionMethod,
                    )
                  : trailingActions(),
            ),
          ),
        ),
        navigationBar: NavigationBarsWidget(
          onSelectItem: (index) {
            setState(() {
              screenIndex = index;
            });
          },
          selectedIndex: screenIndex,
          isExampleBar: false,
        ),
        appBar: getAppBar(),
        body: getScreen(SelectedScreen.values[screenIndex]),
      ),
    );
  }

  PreferredSizeWidget getAppBar() => AppBar(
        title: widget.isMaterial3 ? const Text('Material 3') : const Text('Material 2'),
        actions: !(showMediumSizeLayout || showLargeSizeLayout)
            ? [
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
              ]
            : [Container()],// Not show Hamburger icon, null: Hamburger icon will be shown
      );

  Widget getScreen(SelectedScreen selectedScreen) => switch (selectedScreen) {
        SelectedScreen.component => ComponentsScreen(
            railAnimation: railAnimation,
            scaffoldKey: scaffoldKey,
            showSecondHalf: showMediumSizeLayout || showLargeSizeLayout,
          ),
        SelectedScreen.color => const ColorPalettesScreen(),
        SelectedScreen.typography => const TypographyScreen(),
        SelectedScreen.elevations => const ElevationsScreen(),
      };

  Widget trailingActions() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
