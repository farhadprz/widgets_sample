import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class SlidersWidget extends StatefulWidget {
  const SlidersWidget({super.key});

  @override
  State<SlidersWidget> createState() => _SlidersWidgetState();
}

class _SlidersWidgetState extends State<SlidersWidget> {
  double sliderValue1 = 30.0;
  double sliderValue2 = 20.0;
  RangeValues sliderValue3 = const RangeValues(20, 50);

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Sliders',
      tooltipMessage: 'Use Slider or RangeSlider',
      child: Column(
        children: [
          Slider(
            value: sliderValue1,
            max: 100,
            onChanged: (value) {
              setState(() {
                sliderValue1 = value;
              });
            },
          ),
          colDivider,
          Slider(
            value: sliderValue2,
            label: sliderValue2.round().toString(),
            divisions: 5,
            max: 100,
            onChanged: (value) {
              setState(() {
                sliderValue2 = value;
              });
            },
          ),
          colDivider,
          RangeSlider(
            values: sliderValue3,
            min: 0,
            max: 100,
            divisions: 10,
            labels: RangeLabels(
              sliderValue3.start.round().toString(),
              sliderValue3.end.round().toString(),
            ),
            onChanged: (values){
              setState(() {
                sliderValue3 = values;
              });
            },
          ),
        ],
      ),
    );
  }
}
