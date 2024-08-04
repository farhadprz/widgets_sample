import 'package:flutter/material.dart';
import 'package:widgets_sample/animations/offset_animation.dart';
import 'package:widgets_sample/animations/size_animation.dart';

class RailTransition extends StatefulWidget {
  const RailTransition({
    super.key,
    required this.animation,
    required this.child,
    required this.backgroundColor,
  });

  final Animation<double> animation;
  final Widget child;
  final Color backgroundColor;

  @override
  State<RailTransition> createState() => _RailTransitionState();
}

class _RailTransitionState extends State<RailTransition> {
  late Animation<Offset> offsetAnimation;
  late Animation<double> widgetAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // The animations are only rebuilt by this method when the text
    // direction changes because this widget only depends on Directionality.
    final bool isLtr = Directionality.of(context) == TextDirection.ltr;

    widgetAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(SizeAnimation(widget.animation));

    offsetAnimation = Tween<Offset>(
      begin: isLtr ? const Offset(-1, 0) : const Offset(1, 0),
      end: Offset.zero
    ).animate(OffsetAnimation(widget.animation));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: Align(
          alignment: Alignment.topLeft,
          widthFactor: widgetAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );;
  }
}
