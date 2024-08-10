import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

import 'elevation_card_widget.dart';

class ElevationGridWidget extends StatelessWidget {
  const ElevationGridWidget({
    super.key,
    this.shadowColor,
    this.surfaceTintColor,
  });

  final Color? shadowColor;
  final Color? surfaceTintColor;

  List<ElevationCardWidget> elevationCards(Color? shadowColor, Color? surfaceTintColor) {
    return elevations
        .map((elevationInfo) => ElevationCardWidget(
              info: elevationInfo,
              shadowColor: shadowColor,
              surfaceTint: surfaceTintColor,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          if (constraints.crossAxisExtent < narrowScreenWidthThreshold) {
            return SliverGrid.count(
              crossAxisCount: 3,
              children: elevationCards(shadowColor, surfaceTintColor),
            );
          } else {
            return SliverGrid.count(
              crossAxisCount: 6,
              children: elevationCards(shadowColor, surfaceTintColor),
            );
          }
        },
      ),
    );
  }
}
