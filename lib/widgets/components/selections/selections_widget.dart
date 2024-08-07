import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_group_decoration.dart';
import 'package:widgets_sample/widgets/components/selections/check_boxes_widget.dart';
import 'package:widgets_sample/widgets/components/selections/chips_widget.dart';
import 'package:widgets_sample/widgets/components/selections/date_picker_widget.dart';
import 'package:widgets_sample/widgets/components/selections/menus_widget.dart';
import 'package:widgets_sample/widgets/components/selections/radios_widget.dart';
import 'package:widgets_sample/widgets/components/selections/sliders_widget.dart';
import 'package:widgets_sample/widgets/components/selections/switches_widget.dart';
import 'package:widgets_sample/widgets/components/selections/time_picker_widget.dart';

class SelectionsWidget extends StatelessWidget {
  const SelectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentGroupDecoration(
      label: 'Selection',
      children: [
        CheckBoxesWidget(),
        ChipsWidget(),
        DatePickerWidget(),
        TimePickerWidget(),
        MenusWidget(),
        RadiosWidget(),
        SlidersWidget(),
        SwitchesWidget(),
      ],
    );
  }
}
