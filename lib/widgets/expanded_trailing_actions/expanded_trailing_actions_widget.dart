import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/expanded_trailing_actions/expanded_color_seed_action_widget.dart';
import 'package:widgets_sample/widgets/expanded_trailing_actions/expanded_image_color_action_widget.dart';

class ExpandedTrailingActionsWidget extends StatelessWidget {
  const ExpandedTrailingActionsWidget({
    super.key,
    required this.toggleThemeMode,
    required this.changeMaterialVersion,
    required this.handleColorSelect,
    required this.handleImageSelect,
    required this.isLightMode,
    required this.isMaterial3,
    required this.imageSelected,
    required this.colorSelected,
    required this.colorSelectionMethod,
  });

  final void Function() toggleThemeMode;
  final void Function() changeMaterialVersion;
  final void Function(int) handleColorSelect;
  final void Function(int) handleImageSelect;

  final bool isLightMode;
  final bool isMaterial3;

  final ColorImageProvider imageSelected;
  final ColorSeed colorSelected;
  final ColorSelectionMethod colorSelectionMethod;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final expandedTrailingActionsBody = Container(
      constraints: const BoxConstraints.tightFor(width: 250),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Text('Brightness'),
              Expanded(child: Container()),
              Switch(
                value: isLightMode,
                onChanged: (_) {
                  toggleThemeMode();
                },
              )
            ],
          ),
          Row(
            children: [
              const Text('Material 3'),
              Expanded(child: Container()),
              Switch(
                value: isMaterial3,
                onChanged: (_) {
                  changeMaterialVersion();
                },
              )
            ],
          ),
          const Divider(),
          ExpandedColorSeedActionWidget(
            handleColorSelected: handleColorSelect,
            colorSelected: colorSelected,
            colorSelectionMethod: colorSelectionMethod,
          ),
          const Divider(),
          ExpandedImageColorActionWidget(
            handleImageSelect: handleImageSelect,
            imageSelected: imageSelected,
            colorSelectionMethod: colorSelectionMethod,
          ),
        ],
      ),
    );
    return screenHeight > 740
        ? expandedTrailingActionsBody
        : SingleChildScrollView(
            child: expandedTrailingActionsBody,
          );
  }
}
