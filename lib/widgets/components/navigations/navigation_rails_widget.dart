import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class NavigationRailsWidget extends StatefulWidget {
  const NavigationRailsWidget({super.key});

  @override
  State<NavigationRailsWidget> createState() => _NavigationRailsWidgetState();
}

class _NavigationRailsWidgetState extends State<NavigationRailsWidget> {
  int navRailIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Navigation Rail',
      tooltipMessage: 'Use NavigationRail',
      child: IntrinsicWidth(
        child: SizedBox(
          height: 420,
          child: NavigationRail(
            elevation: 4,
            onDestinationSelected: (index) {
              setState(() {
                navRailIndex = index;
              });
            },
            groupAlignment: 0.0,
            labelType: NavigationRailLabelType.selected,
            destinations: destinations
                .map(
                  (destination) => NavigationRailDestination(
                    icon: destination.icon,
                    label: Text(destination.label),
                    selectedIcon: destination.selectedIcon,
                  ),
                )
                .toList(),
            selectedIndex: navRailIndex,
            leading: FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.create,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
