import 'package:flutter/material.dart';
import 'package:widgets_sample/animations/offset_animation.dart';
import 'package:widgets_sample/animations/size_animation.dart';
import 'package:widgets_sample/constants.dart';

class SplitTransition extends StatefulWidget {
  const SplitTransition({
    super.key,
    required this.animation,
    required this.componentList,
    required this.secondPartComponentList,
  });

  final Animation<double> animation;
  final Widget componentList;
  final Widget secondPartComponentList;

  @override
  State<SplitTransition> createState() => _SplitTransitionState();
}

class _SplitTransitionState extends State<SplitTransition> {
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(OffsetAnimation(widget.animation));

    widthAnimation = Tween<double>(
      begin: 0,
      end: mediumWidthBreakpoint,
    ).animate(SizeAnimation(widget.animation));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: mediumWidthBreakpoint.toInt(),
          child: widget.componentList,
        ),
        if (widthAnimation.value.toInt() > 0) ...[ // ... is called the spread operator.
                                                   // It is used to insert the elements of an iterable (like a list or set) into another collection.
                                                   // ...? is called the Null-Safe Spread.
          Flexible(
            flex: widthAnimation.value.toInt(),
            child: FractionalTranslation(
              translation: offsetAnimation.value,
              child: widget.secondPartComponentList,
            ),
          )
        ]
      ],
    );
  }
}
