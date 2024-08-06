import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/components_list.dart';
import 'package:widgets_sample/widgets/components/second_half_components_list.dart';

import '../transitions/split_transition.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({
    super.key,
    required this.railAnimation,
    required this.scaffoldKey,
    required this.showSecondHalf,
  });

  final CurvedAnimation railAnimation;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showSecondHalf;

  @override
  Widget build(BuildContext context) {
    return SplitTransition(
      animation: railAnimation,
      componentList: ComponentsList(scaffoldKey: scaffoldKey, showSecondHalf: showSecondHalf),
      secondPartComponentList: SecondHalfComponentsList(scaffoldKey: scaffoldKey),
    );
  }
}
