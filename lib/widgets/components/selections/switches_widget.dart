import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class SwitchesWidget extends StatelessWidget {
  const SwitchesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentDecoration(
      label: 'Switches',
      tooltipMessage: 'Use SwitchListTile or Switch',
      child: Column(
        children: [
          SwitchRow(isEnabled: true),
          SwitchRow(isEnabled: false),
        ],
      ),
    );
  }
}

class SwitchRow extends StatefulWidget {
  const SwitchRow({
    super.key,
    required this.isEnabled,
  });

  final bool isEnabled;

  @override
  State<SwitchRow> createState() => _SwitchRowState();
}

class _SwitchRowState extends State<SwitchRow> {
  bool value1 = false;
  bool value2 = true;

  final WidgetStateProperty<Icon?> thumbIcon = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return const Icon(Icons.check);
    } else {
      return const Icon(Icons.close);
    }
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // TODO: use SwitchListTile when thumbIcon is available https://github.com/flutter/flutter/issues/118616
        Switch(
          value: value1,
          onChanged: widget.isEnabled
              ? (value) {
                  setState(() {
                    value1 = value;
                  });
                }
              : null,
        ),
        Switch(
          thumbIcon: thumbIcon,
          value: value2,
          onChanged: widget.isEnabled
              ? (value) {
                  setState(() {
                    value2 = value;
                  });
                }
              : null,
        ),
      ],
    );
  }
}
