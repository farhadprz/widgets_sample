import 'package:flutter/material.dart';

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoiceSegmentedButtonsWidget extends StatefulWidget {
  const MultipleChoiceSegmentedButtonsWidget({super.key});

  @override
  State<MultipleChoiceSegmentedButtonsWidget> createState() => _MultipleChoiceSegmentedButtonsWidgetState();
}

class _MultipleChoiceSegmentedButtonsWidgetState extends State<MultipleChoiceSegmentedButtonsWidget> {
  Set<Sizes> selection = {Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: const [
        ButtonSegment(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment(value: Sizes.small, label: Text('S')),
        ButtonSegment(value: Sizes.medium, label: Text('M')),
        ButtonSegment(value: Sizes.large, label: Text('L')),
        ButtonSegment(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
