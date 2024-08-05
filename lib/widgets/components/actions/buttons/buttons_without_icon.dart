import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class ButtonsWithoutIcon extends StatelessWidget {
  const ButtonsWithoutIcon({
    super.key,
    required this.isDisable,
  });

  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: IntrinsicWidth(// A widget that sizes its child to match the child's intrinsic width, useful for aligning children of different widths.
                            // The IntrinsicWidth widget ensures that both ElevatedButton widgets
                            // in the Column will be the same width, which will be the width of the longest button text.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: isDisable ? null : () {}, child: const Text('Elevated')),
            colDivider,
            FilledButton(onPressed: isDisable ? null : () {}, child: const Text('Filled')), // For primary actions
            colDivider,
            FilledButton.tonal(onPressed: isDisable ? null : () {}, child: const Text('Filled tonal')), // For secondary actions
            colDivider,
            OutlinedButton(onPressed: isDisable ? null : () {}, child: const Text('Outlined')),
            colDivider,
            TextButton(onPressed: isDisable ? null : () {}, child: const Text('Text')),
          ],
        ),
      ),
    );
  }
}
