import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Date picker',
      tooltipMessage: 'use ShowDataPicker',
      child: TextButton.icon(
        onPressed: () async {
          DateTime? selectedDataTime = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: _firstDate,
            lastDate: _lastDate,
          );
          setState(() {
            selectedDate = selectedDataTime;
            if (selectedDate != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Selected Data: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
              ));
            }
          });
        },
        label: const Text(
          'Show date picker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.calendar_month),
      ),
    );
  }
}
