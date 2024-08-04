import 'package:flutter/material.dart';

class OffsetAnimation extends CurvedAnimation {
  OffsetAnimation(Animation<double> parent)
      : super(
          parent: parent,
          curve: const Interval(// The Interval specifies the range of the parent animation during which the child animation is active.
            0.4,
            1.0,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          reverseCurve: Interval(// This parameter specifies the behavior when the animation is reversed (when the animation is playing backward).
            0,
            0.2,
            curve: Curves.easeInOutCubicEmphasized.flipped,
          ),
        );
}
