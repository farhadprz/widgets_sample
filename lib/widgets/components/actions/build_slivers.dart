import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildSlivers extends SliverChildBuilderDelegate {
  BuildSlivers({
    required NullableIndexedWidgetBuilder builder,
    required this.heights,
  }) : super(builder, childCount: heights.length);

  final List<double?> heights;

  @override
  double? estimateMaxScrollOffset(
    int firstIndex,
    int lastIndex,
    double leadingScrollOffset,
    double trailingScrollOffset,
  ) {
    return heights.reduce((sum, height) => (sum ?? 0) + (height ?? 0))!;
  }
}
