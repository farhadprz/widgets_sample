import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// If the content of a CustomScrollView does not change, then it's
// safe to cache the heights of each item as they are laid out. The
// sum of the cached heights are returned by an override of
// `SliverChildDelegate.estimateMaxScrollOffset`. The default version
// of this method bases its estimate on the average height of the
// visible items. The override ensures that the scrollbar thumb's
// size, which depends on the max scroll offset, will shrink smoothly
// as the contents of the list are exposed for the first time, and
// then remain fixed.
class CacheHeight extends SingleChildRenderObjectWidget {
  const CacheHeight({
    super.child,
    required this.heights,
    required this.index,
  });

  final List<double?> heights;
  final int index;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderCacheHeight(heights: heights, index: index);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderCacheHeight renderObject) {
    renderObject
      ..heights = heights //  Cascade operator
      ..index = index;
  }
}

class _RenderCacheHeight extends RenderProxyBox {
  _RenderCacheHeight({
    required List<double?> heights,
    required int index,
  })  : _heights = heights,
        _index = index,
        super();

  List<double?> _heights;
  int _index;

  List<double?> get heights => _heights;

  int get index => _index;

  set heights(List<double?> value) {
    if (value == _heights) {
      return;
    }
    _heights = value;
    markNeedsLayout();
  }

  set index(int value) {
    if (value == _index) {
      return;
    }
    _index = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    super.performLayout();
    heights[index] = size.height;
  }
}
