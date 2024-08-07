import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

enum Options { option1, option2, option3 }

class RadiosWidget extends StatefulWidget {
  const RadiosWidget({super.key});

  @override
  State<RadiosWidget> createState() => _RadiosWidgetState();
}

class _RadiosWidgetState extends State<RadiosWidget> {
  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Radio buttons',
      tooltipMessage: 'Use RadioListTile<T> or Radio<T>',
      child: Column(
        children: [
          RadioListTile(
            title: const Text('Option 1'),
            value: Options.option1,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('Option 2'),
            value: Options.option2,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('Option 3'),
            value: Options.option3,
            groupValue: _selectedOption,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
