import 'package:flutter/material.dart';
import 'package:widgets_sample/animations/offset_animation.dart';
import 'package:widgets_sample/animations/size_animation.dart';

class BarTransition extends StatefulWidget {
  const BarTransition({
    super.key,
    required this.animation,
    required this.backgroundColor,
    required this.child,
  });

  final Animation<double> animation;
  final Color backgroundColor;
  final Widget child;

  @override
  State<BarTransition> createState() => _BarTransitionState();
}

class _BarTransitionState extends State<BarTransition> {
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> heightAnimation;

  @override
  void initState() {
    super.initState();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),// Which means fully off the bottom of the screen (dx, dy)
      end: Offset.zero, // Which is the default position, typically at the center or the origin
    ).animate(OffsetAnimation(widget.animation)); //  Instead of directly using an AnimationController,
                                                  // you're using another animation to control the tween.

    heightAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(SizeAnimation(widget.animation));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: Align(
          alignment: Alignment.topLeft,
          heightFactor: heightAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
