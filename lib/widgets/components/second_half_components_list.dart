import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/actions/build_slivers.dart';
import 'package:widgets_sample/widgets/components/actions/cache_height.dart';
import 'package:widgets_sample/widgets/components/navigations/navigations_widget.dart';
import 'package:widgets_sample/widgets/components/selections/selections_widget.dart';
import 'package:widgets_sample/widgets/components/text_inputs/text_inputs_widget.dart';

class SecondHalfComponentsList extends StatelessWidget {
  const SecondHalfComponentsList({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      NavigationsWidget(scaffoldKey: scaffoldKey),
      colDivider,
      const SelectionsWidget(),
      colDivider,
      const TextInputsWidget(),
    ];
    List<double?> heights = List.filled(children.length, null);

    // Fully traverse this list before moving on.
    return FocusTraversalGroup(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(end: smallSpacing),
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
