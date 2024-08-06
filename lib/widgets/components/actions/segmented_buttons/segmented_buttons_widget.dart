import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/actions/segmented_buttons/multiple_choice_segmented_buttons_widget.dart';
import 'package:widgets_sample/widgets/components/actions/segmented_buttons/single_choice_segmented_buttons_widget.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class SegmentedButtonsWidget extends StatelessWidget {
  const SegmentedButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentDecoration(
      label: 'Segmented buttons',
      tooltipMessage: 'Use SegmentedButton<T>',
      child: Column(
        children: [
          SingleChoiceSegmentedButtonsWidget(),
          colDivider,
          MultipleChoiceSegmentedButtonsWidget(),
        ],
      ),
    );
  }
}
