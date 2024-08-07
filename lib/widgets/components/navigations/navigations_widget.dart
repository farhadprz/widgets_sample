import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_group_decoration.dart';
import 'package:widgets_sample/widgets/components/navigations/bottom_app_bars_widget.dart';
import 'package:widgets_sample/widgets/components/navigations/navigation_drawers_widget.dart';
import 'package:widgets_sample/widgets/components/navigations/navigation_rails_widget.dart';
import 'package:widgets_sample/widgets/components/navigations/search_anchors_widget.dart';
import 'package:widgets_sample/widgets/components/navigations/tabs_widget.dart';
import 'package:widgets_sample/widgets/components/navigations/top_app_bars_widget.dart';
import 'package:widgets_sample/widgets/navigation_bars_widget.dart';

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
      children: [
        BottomAppBarsWidget(),
        TopAppBarsWidget(),
        NavigationBarsWidget(selectedIndex: 0, isExampleBar: true),
        NavigationDrawersWidget(),
        NavigationRailsWidget(),
        TabsWidget(),
        SearchAnchorsWidget(),
      ],
    );
  }
}
