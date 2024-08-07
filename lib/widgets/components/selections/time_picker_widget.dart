import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Time picker',
      tooltipMessage: 'Use showTimePicker',
      child: TextButton.icon(
        onPressed: () async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: selectedTime ?? TimeOfDay.now(),
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            ),
          );
          setState(() {
            selectedTime = time;
            if (selectedTime != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Selected time: ${selectedTime!.format(context)}'),
              ));
            }
          });
        },
        label: const Text(
          'show time picker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.schedule),
      ),
    );
  }
}
