import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/elevations/elevation_grid_widget.dart';

class ElevationsScreen extends StatelessWidget {
  const ElevationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).colorScheme.shadow;
    Color surfaceTint = Theme.of(context).colorScheme.primary;

    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Text('Surface Tint Color Only', style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          ElevationGridWidget(surfaceTintColor: surfaceTint, shadowColor: Colors.transparent),
          SliverList(
            delegate: SliverChildListDelegate([
              colDivider,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Text('Surface Tint Color and Shadow Color', style: Theme.of(context).textTheme.titleLarge),
              ),
            ]),
          ),
          ElevationGridWidget(surfaceTintColor: surfaceTint, shadowColor: shadowColor),
          SliverList(
            delegate: SliverChildListDelegate([
              colDivider,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Text('Shadow Color Only', style: Theme.of(context).textTheme.titleLarge),
              ),
            ]),
          ),
          ElevationGridWidget(shadowColor: shadowColor),
        ],
      ),
    );
  }
}
