import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class NavigationDrawerSectionWidget extends StatefulWidget {
  const NavigationDrawerSectionWidget({super.key});

  @override
  State<NavigationDrawerSectionWidget> createState() => _NavigationDrawerSectionWidgetState();
}

class _NavigationDrawerSectionWidgetState extends State<NavigationDrawerSectionWidget> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index) {
        setState(() {
          navDrawerIndex = index;
        });
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Mail',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...destinations.map(
          (destination) => NavigationDrawerDestination(
            icon: destination.icon,
            label: Text(destination.label),
            selectedIcon: destination.selectedIcon,
          ),
        ),
        const Divider(indent: 28, endIndent: 28),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Labels',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...labelDestination.map(
          (destination) => NavigationDrawerDestination(
            icon: destination.icon,
            label: Text(destination.label),
            selectedIcon: destination.selectedIcon,
          ),
        ),
      ],
    );
  }
}
