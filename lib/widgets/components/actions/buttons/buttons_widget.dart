import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/actions/buttons/buttons_without_icon.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

import 'buttons_with_icon.dart';

class ButtonsWidget extends StatefulWidget {
  const ButtonsWidget({super.key});

  @override
  State<ButtonsWidget> createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return const ComponentDecoration(
      label: 'Common buttons',
      tooltipMessage: 'Use ElevatedButton, FilledButton, FilledButton.tonal, OutlinedButton, or TextButton',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonsWithoutIcon(isDisable: false),
            ButtonsWithIcon(),
            ButtonsWithoutIcon(isDisable: true),
          ],
        ),
      ),
    );
  }
}
