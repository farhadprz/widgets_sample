import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class DividersWidget extends StatelessWidget {
  const DividersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentDecoration(
      label: 'Dividers',
      tooltipMessage: 'Use Divider or VerticalDivider',
      child: Divider(key: Key('divider')),
    );
  }
}
