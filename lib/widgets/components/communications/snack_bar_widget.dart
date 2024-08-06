import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Snackbar',
      tooltipMessage: 'Use ScaffoldMessenger.of(context).showSnackBar with SnackBar',
      child: TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('This is a snackbar'),
              behavior: SnackBarBehavior.floating,
              width: 400.0,
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {},
              ),
            ),
          );
        },
        child: const Text('Show snackbar', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
