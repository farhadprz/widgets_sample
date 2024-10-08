import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/actions/actions_widget.dart';
import 'package:widgets_sample/widgets/components/actions/build_slivers.dart';
import 'package:widgets_sample/widgets/components/actions/cache_height.dart';
import 'package:widgets_sample/widgets/components/communications/communications_widget.dart';
import 'package:widgets_sample/widgets/components/containments/containment_widget.dart';
import 'package:widgets_sample/widgets/components/navigations/navigations_widget.dart';
import 'package:widgets_sample/widgets/components/selections/selections_widget.dart';
import 'package:widgets_sample/widgets/components/text_inputs/text_inputs_widget.dart';

class ComponentsList extends StatelessWidget {
  const ComponentsList({
    super.key,
    required this.scaffoldKey,
    required this.showSecondHalf,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showSecondHalf;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const ActionsWidget(),
      colDivider,
      const CommunicationsWidget(),
      colDivider,
      const ContainmentWidget(),
      if(!showSecondHalf) ...[
        colDivider,
        NavigationsWidget(scaffoldKey: scaffoldKey),
        colDivider,
        const SelectionsWidget(),
        colDivider,
        const TextInputsWidget(),
      ]
    ];
    List<double?> heights = List.filled(children.length, null); // A list of a specific length, but you either can't or
    // don't want to assign actual values to the elements right away. Instead, you fill the list with null or another default value,

    return FocusTraversalGroup(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: showSecondHalf ? const EdgeInsetsDirectional.only(end: smallSpacing) : EdgeInsets.zero,
            sliver: SliverList(
              delegate: BuildSlivers(
                heights: heights,
                builder: (context, index) => CacheHeight(
                  heights: heights,
                  index: index,
                  child: children[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
