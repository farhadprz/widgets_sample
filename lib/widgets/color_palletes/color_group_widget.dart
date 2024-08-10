import 'package:flutter/material.dart';

import 'color_chip_widget.dart';

class ColorGroupWidget extends StatelessWidget {
  const ColorGroupWidget({
    super.key,
    required this.children,
  });

  final List<ColorChipWidget> children;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
