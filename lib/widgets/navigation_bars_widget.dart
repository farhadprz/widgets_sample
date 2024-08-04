import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class NavigationBarsWidget extends StatefulWidget {
  const NavigationBarsWidget({
    super.key,
    this.onSelectItem,
    required this.selectedIndex,
    required this.isExampleBar,
    this.isBadgeExample = false,
  });

  final void Function(int)? onSelectItem;
  final int selectedIndex;
  final bool isExampleBar;
  final bool isBadgeExample;

  @override
  State<NavigationBarsWidget> createState() => _NavigationBarsWidgetState();
}

class _NavigationBarsWidgetState extends State<NavigationBarsWidget> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(covariant NavigationBarsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget navigationBar = NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
        if (!widget.isExampleBar) widget.onSelectItem!(index);
      },
      destinations: widget.isExampleBar && widget.isBadgeExample
          ? bottomNavigationBarItems
          : widget.isExampleBar
              ? bottomNavigationBarItems
              : bottomNavigationBarItems,
    );

    return navigationBar;
  }
}
