import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class TopAppBarsWidget extends StatelessWidget {
  const TopAppBarsWidget({super.key});

  static final actions = [
    IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
    IconButton(onPressed: () {}, icon: const Icon(Icons.event)),
    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
  ];

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Top app bar',
      tooltipMessage: 'Use AppBar, SliverAppBar, SliverAppBar.medium, or  SliverAppBar.large',
      child: Column(
        children: [
          AppBar(
            title: const Text('Center-aligned'),
            leading: const BackButton(),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined),
                iconSize: 32,
              ),
            ],
          ),
          colDivider,
          AppBar(
            title: const Text('Small'),
            leading: const BackButton(),
            centerTitle: false,
            actions: actions,
          ),
          colDivider,
          SizedBox(
            height: 100,
            child: CustomScrollView(
              slivers: [
                SliverAppBar.medium(
                  title: const Text('Medium'),
                  leading: const BackButton(),
                  actions: actions,
                ),
                const SliverFillRemaining(),
              ],
            ),
          ),
          colDivider,
          SizedBox(
            height: 130,
            child: CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  title: const Text('Large'),
                  leading: const BackButton(),
                  actions: actions,
                ),
                const SliverFillRemaining(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
