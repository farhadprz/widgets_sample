import 'package:flutter/material.dart';

class ColorChipWidget extends StatelessWidget {
  const ColorChipWidget({
    super.key,
    required this.color,
    this.onColor,
    required this.label,
  });

  final Color color;
  final Color? onColor;
  final String label;

  static Color contrastColor(Color color) => switch (ThemeData.estimateBrightnessForColor(color)) {
        Brightness.light => Colors.black,
        Brightness.dark => Colors.white
      };

  @override
  Widget build(BuildContext context) {
    final Color labelColor = onColor ?? contrastColor(color);

    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Text(label, style: TextStyle(color: labelColor))),
          ],
        ),
      ),
    );
  }
}
