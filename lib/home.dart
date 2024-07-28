import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/material_button_widget.dart';
import 'package:widgets_sample/widgets/navigation_transition_widget.dart';
import 'package:widgets_sample/widgets/theme_button_widget.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.isMaterial3,
    required this.toggleThemeMode,
    required this.changeMaterialVersion,
  });

  final bool isMaterial3;
  final void Function() toggleThemeMode;
  final void Function() changeMaterialVersion;

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
        ],
      );
}
