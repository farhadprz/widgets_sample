import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class ProcessIndicatorsWidget extends StatefulWidget {
  const ProcessIndicatorsWidget({super.key});

  @override
  State<ProcessIndicatorsWidget> createState() => _ProcessIndicatorsWidgetState();
}

class _ProcessIndicatorsWidgetState extends State<ProcessIndicatorsWidget> {
  bool playProcessIndicator = false;

  @override
  Widget build(BuildContext context) {
    final double? progressValue = playProcessIndicator ? null : 0.7;

    return ComponentDecoration(
      label: 'Progress Indicator',
      tooltipMessage: 'Use CircularProgressIndicator or LinearProgressIndicator',
      child: Row(
        children: [
          IconButton.filledTonal(
            isSelected: playProcessIndicator,
            onPressed: () {
              setState(() {
                playProcessIndicator = !playProcessIndicator;
              });
            },
            icon: const Icon(Icons.play_arrow),
            selectedIcon: const Icon(Icons.pause),
          ),
          Expanded(
            child: Row(
              children: [
                rowDivider,
                CircularProgressIndicator(value: progressValue),
                rowDivider,
                Expanded(child: LinearProgressIndicator(value: progressValue)),
                rowDivider,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
