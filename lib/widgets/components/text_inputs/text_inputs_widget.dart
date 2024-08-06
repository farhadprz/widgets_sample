import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';
import 'package:widgets_sample/widgets/components/component_group_decoration.dart';
import 'package:widgets_sample/widgets/components/text_inputs/clear_button_widget.dart';

class TextInputsWidget extends StatefulWidget {
  const TextInputsWidget({super.key});

  @override
  State<TextInputsWidget> createState() => _TextInputsWidgetState();
}

class _TextInputsWidgetState extends State<TextInputsWidget> {
  final TextEditingController _controllerFilled = TextEditingController();
  final TextEditingController _controllerOutlined = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ComponentGroupDecoration(
      label: 'Text inputs',
      children: [
        ComponentDecoration(
          label: 'Text fields',
          tooltipMessage: 'Use TextField with different InputDecoration',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(smallSpacing),
                child: TextField(
                  controller: _controllerFilled,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: ClearButtonWidget(controller: _controllerFilled),
                    labelText: 'Filled',
                    hintText: 'hint text',
                    helperText: 'supporting text',
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(smallSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          maxLength: 10,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          controller: _controllerFilled,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: ClearButtonWidget(controller: _controllerFilled),
                            labelText: 'Filled',
                            hintText: 'hint text',
                            helperText: 'supporting text',
                            filled: true,
                            errorText: 'error text'
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _controllerFilled,
                          enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: ClearButtonWidget(controller: _controllerFilled),
                            labelText: 'Disabled',
                            hintText: 'hint text',
                            helperText: 'supporting text',
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(smallSpacing),
                child: TextField(
                  controller: _controllerOutlined,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: ClearButtonWidget(controller: _controllerOutlined),
                    labelText: 'Outlined',
                    hintText: 'hint text',
                    helperText: 'supporting text',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(smallSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _controllerOutlined,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: ClearButtonWidget(controller: _controllerOutlined),
                            labelText: 'Outlined',
                            hintText: 'hint text',
                            helperText: 'supporting text',
                            filled: true,
                            errorText: 'error text',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _controllerOutlined,
                          enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: ClearButtonWidget(controller: _controllerOutlined),
                            labelText: 'Disabled',
                            hintText: 'hint text',
                            helperText: 'supporting text',
                            filled: true,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
