import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class ExpandedImageColorActionWidget extends StatelessWidget {
  const ExpandedImageColorActionWidget({
    super.key,
    required this.handleImageSelect,
    required this.imageSelected,
    required this.colorSelectionMethod,
  });

  final void Function(int) handleImageSelect;
  final ColorImageProvider imageSelected;
  final ColorSelectionMethod colorSelectionMethod;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
