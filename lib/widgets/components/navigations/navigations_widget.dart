import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_group_decoration.dart';

class NavigationsWidget extends StatelessWidget {
  const NavigationsWidget({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return const ComponentGroupDecoration(
      label: 'Navigation',
      children: [],
    );
  }
}
