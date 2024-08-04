import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class ExpandedColorSeedActionWidget extends StatelessWidget {
  const ExpandedColorSeedActionWidget({
    super.key,
    required this.handleColorSelected,
    required this.colorSelected,
    required this.colorSelectionMethod,
  });

  final void Function(int) handleColorSelected;
  final ColorSeed colorSelected;
  final ColorSelectionMethod colorSelectionMethod;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          ColorSeed.values.length,
          (index) => IconButton(
            onPressed: () => handleColorSelected(index),
            icon: const Icon(Icons.radio_button_unchecked),
            color: ColorSeed.values[index].color,
            isSelected:
                colorSelected == ColorSeed.values[index] && colorSelectionMethod == ColorSelectionMethod.colorSeed,
            selectedIcon: const Icon(Icons.radio_button_checked),
            tooltip: ColorSeed.values[index].label,
          ),
        ),
      ),
    );
  }
}
