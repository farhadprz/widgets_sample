import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_group_decoration.dart';
import 'package:widgets_sample/widgets/components/containments/bottom_sheets_widget.dart';
import 'package:widgets_sample/widgets/components/containments/cards_widget.dart';
import 'package:widgets_sample/widgets/components/containments/dialogs_widget.dart';
import 'package:widgets_sample/widgets/components/containments/dividers_widget.dart';

class ContainmentWidget extends StatelessWidget {
  const ContainmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentGroupDecoration(
      label: 'Containment',
      children: [
        BottomSheetsWidget(),
        CardsWidget(),
        DialogsWidget(),
        DividersWidget(),
        // TODO: Add Lists, https://github.com/flutter/flutter/issues/114006
        // TODO: Add Side sheets, https://github.com/flutter/flutter/issues/119328
      ],
    );
  }
}
