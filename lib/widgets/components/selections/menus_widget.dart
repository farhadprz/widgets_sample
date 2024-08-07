import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';
import 'package:widgets_sample/widgets/components/selections/button_anchor_example.dart';
import 'package:widgets_sample/widgets/components/selections/icon_button_anchor_example.dart';

class MenusWidget extends StatefulWidget {
  const MenusWidget({super.key});

  @override
  State<MenusWidget> createState() => _MenusWidgetState();
}

class _MenusWidgetState extends State<MenusWidget> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  IconLabel? selectedIcon = IconLabel.smile;
  ColorLabel? selectedColor;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ColorLabel>> colorEntries = <DropdownMenuEntry<ColorLabel>>[];
    for (final ColorLabel colorLabel in ColorLabel.values) {
      colorEntries.add(DropdownMenuEntry<ColorLabel>(
          value: colorLabel, label: colorLabel.label, enabled: colorLabel.label != 'Grey'));
    }

    final List<DropdownMenuEntry<IconLabel>> iconEntries = <DropdownMenuEntry<IconLabel>>[];
    for (final IconLabel iconLabel in IconLabel.values) {
      iconEntries.add(DropdownMenuEntry<IconLabel>(value: iconLabel, label: iconLabel.label));
    }

    return ComponentDecoration(
      label: 'Menus',
      tooltipMessage: 'Use MenuAnchor or DropdownMenu<T>',
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonAnchorExample(),
              rowDivider,
              IconButtonAnchorExample(),
            ],
          ),
          colDivider,
          Wrap(
            alignment: WrapAlignment.spaceAround,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: smallSpacing,
            runSpacing: smallSpacing,
            children: [
              DropdownMenu(
                controller: colorController,
                label: const Text('Color'),
                enableFilter: true,
                inputDecorationTheme: const InputDecorationTheme(filled: true),
                dropdownMenuEntries: colorEntries,
                onSelected: (color) {
                  selectedColor = color;
                },
              ),
              DropdownMenu(
                controller: iconController,
                label: const Text('Icon'),
                enableFilter: true,
                inputDecorationTheme: const InputDecorationTheme(filled: true),
                dropdownMenuEntries: iconEntries,
                onSelected: (icon) {
                  selectedIcon = icon;
                },
              ),
              Icon(
                selectedIcon?.icon,
                color: selectedColor?.color ?? Colors.grey.withOpacity(0.5),
              )
            ],
          ),
        ],
      ),
    );
  }
}
