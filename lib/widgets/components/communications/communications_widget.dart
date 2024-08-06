import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/communications/process_indicators_widget.dart';
import 'package:widgets_sample/widgets/components/communications/snack_bar_widget.dart';
import 'package:widgets_sample/widgets/components/component_group_decoration.dart';
import 'package:widgets_sample/widgets/navigation_bars_widget.dart';

class CommunicationsWidget extends StatelessWidget {
  const CommunicationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentGroupDecoration(
      label: 'Communication',
      children: [
        NavigationBarsWidget(
          selectedIndex: 1,
          isExampleBar: true,
          isBadgeExample: true,
        ),
        ProcessIndicatorsWidget(),
        SnackBarWidget(),
      ],
    );
  }
}
