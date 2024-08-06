import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class IconToggleButtonsWidget extends StatefulWidget {
  const IconToggleButtonsWidget({super.key});

  @override
  State<IconToggleButtonsWidget> createState() => _IconToggleButtonsWidgetState();
}

class _IconToggleButtonsWidgetState extends State<IconToggleButtonsWidget> {
  bool standardSelected = false;
  bool filledSelected = false;
  bool tonalSelected = false;
  bool outlinedSelected = false;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Icon Buttons',
      tooltipMessage: 'Use IconButton, IconButton.filled, IconButton.filledTonal, and IconButton.outlined',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                isSelected: standardSelected,
                onPressed: () {
                  setState(() {
                    standardSelected = !standardSelected;
                  });
                },
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
              colDivider,
              IconButton(
                isSelected: standardSelected,
                onPressed: null,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
            ],
          ),
          Column(
            children: [
              IconButton.filled(
                isSelected: filledSelected,
                onPressed: () {
                  setState(() {
                    filledSelected = !filledSelected;
                  });
                },
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
              colDivider,
              IconButton.filled(
                isSelected: filledSelected,
                onPressed: null,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
            ],
          ),
          Column(
            children: [
              IconButton.filledTonal(
                isSelected: tonalSelected,
                onPressed: () {
                  setState(() {
                    tonalSelected = !tonalSelected;
                  });
                },
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
              colDivider,
              IconButton.filledTonal(
                isSelected: tonalSelected,
                onPressed: null,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
            ],
          ),
          Column(
            children: [
              IconButton.outlined(
                isSelected: outlinedSelected,
                onPressed: () {
                  setState(() {
                    outlinedSelected = !outlinedSelected;
                  });
                },
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
              colDivider,
              IconButton.outlined(
                isSelected: outlinedSelected,
                onPressed: null,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
