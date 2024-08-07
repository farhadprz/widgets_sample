import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';
import 'package:widgets_sample/widgets/components/selections/icon_button_anchor_example.dart';

class BottomAppBarsWidget extends StatelessWidget {
  const BottomAppBarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Bottom app bar',
      tooltipMessage: 'Use BottomAppBar',
      child: SizedBox(
        height: 80,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            elevation: 0.0,
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                const IconButtonAnchorExample(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  tooltip: 'Search',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  tooltip: 'Favorite',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
