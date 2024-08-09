import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';
import 'package:widgets_sample/widgets/components/navigations/drawer/navigation_drawer_section_widget.dart';

class NavigationDrawersWidget extends StatelessWidget {
  const NavigationDrawersWidget({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Navigation drawer',
      tooltipMessage: 'Use NavigationDrawer. For modal navigation drawers, see Scaffold.endDrawer',
      child: Column(
        children: [
          const SizedBox(height: 520, child: NavigationDrawerSectionWidget()),
          colDivider,
          colDivider,
          TextButton(
            onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
            child: const Text(
              'Show modal navigation drawer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
