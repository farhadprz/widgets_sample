import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/actions/buttons/buttons_widget.dart';
import 'package:widgets_sample/widgets/components/actions/floating_action_buttons/floating_action_buttons_widget.dart';
import 'package:widgets_sample/widgets/components/actions/icon_toggle_buttons/icon_toggle_buttons_widget.dart';
import 'package:widgets_sample/widgets/components/actions/segmented_buttons/segmented_buttons_widget.dart';
import 'package:widgets_sample/widgets/components/component_group_decoration.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentGroupDecoration(label: 'Actions', children: [
      ButtonsWidget(),
      FloatingActionButtonsWidget(),
      IconToggleButtonsWidget(),
      SegmentedButtonsWidget(),
    ]);
  }
}
