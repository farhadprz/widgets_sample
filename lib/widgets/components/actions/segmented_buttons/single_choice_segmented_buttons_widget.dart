import 'package:flutter/material.dart';

enum Calendar { day, week, month, year }

class SingleChoiceSegmentedButtonsWidget extends StatefulWidget {
  const SingleChoiceSegmentedButtonsWidget({super.key});

  @override
  State<SingleChoiceSegmentedButtonsWidget> createState() => _SingleChoiceSegmentedButtonsWidgetState();
}

class _SingleChoiceSegmentedButtonsWidgetState extends State<SingleChoiceSegmentedButtonsWidget> {
  Calendar calendar = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
        segments: const [
          ButtonSegment<Calendar>(value: Calendar.day, label: Text('Day'), icon: Icon(Icons.calendar_view_day)),
          ButtonSegment<Calendar>(value: Calendar.week, label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
          ButtonSegment<Calendar>(value: Calendar.month, label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
          ButtonSegment<Calendar>(value: Calendar.year, label: Text('Year'), icon: Icon(Icons.calendar_today)),
        ],
        selected: {
          calendar
        },
        onSelectionChanged: (newSelection) {
          setState(() {
            calendar = newSelection.first;
          });
        });
  }
}
