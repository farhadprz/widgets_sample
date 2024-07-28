import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class ColorSeedButtonWidget extends StatelessWidget {
  const ColorSeedButtonWidget({
    super.key,
    required this.handleColorSelect,
    required this.colorSelected,
    required this.colorSelectionMethod,
  });

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;
  final ColorSelectionMethod colorSelectionMethod;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.palette_outlined),
      tooltip: 'Select a seed color',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) => List.generate(
        ColorSeed.values.length,
        (index) {
          ColorSeed currentColor = ColorSeed.values[index];
          return PopupMenuItem(
            value: index,
            enabled: currentColor != colorSelected || colorSelectionMethod != ColorSelectionMethod.colorSeed,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    currentColor == colorSelected && colorSelectionMethod != ColorSelectionMethod.image
                        ? Icons.color_lens
                        : Icons.color_lens_outlined,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(currentColor.label),
                ),
              ],
            ),
          );
        },
      ),
      onSelected: handleColorSelect,
    );
  }
}
