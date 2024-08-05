import 'package:flutter/material.dart';

import '../../constants.dart';

class ComponentGroupDecoration extends StatelessWidget {
  const ComponentGroupDecoration({
    super.key,
    required this.label,
    required this.children,
  });

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      // Fully traverse this component group before moving to next component group
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: Column(
              children: [
                Text(label, style: Theme.of(context).textTheme.titleLarge),
                colDivider,
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
