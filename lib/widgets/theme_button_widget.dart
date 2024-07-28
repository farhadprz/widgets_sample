import 'package:flutter/material.dart';

class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({
    super.key,
    required this.toggleThemeMode,
    this.showTooltipBelow = true,
  });

  final void Function() toggleThemeMode;
  final bool showTooltipBelow;

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: 'Toggle theme',
      child: IconButton(
        onPressed: toggleThemeMode,
        icon: isLightMode ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.light_mode_outlined),
      ),
    );
  }
}
