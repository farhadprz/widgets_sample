import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class ComponentDecoration extends StatefulWidget {
  const ComponentDecoration({
    super.key,
    required this.label,
    required this.child,
    this.tooltipMessage = '',
  });

  final String label;
  final Widget child;
  final String? tooltipMessage;

  @override
  State<ComponentDecoration> createState() => _ComponentDecorationState();
}

class _ComponentDecorationState extends State<ComponentDecoration> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Helps optimize the rendering performance of your application by controlling when parts of the widget tree should be redrawn, or "repainted."
    // When Use: High-Frequency Updates (like animation), Scroll Views, Complex Widgets
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: smallSpacing),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.label, style: Theme.of(context).textTheme.titleSmall),
                Tooltip(
                  message: widget.tooltipMessage,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(Icons.info_outline, size: 16),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: widthConstraint),
              // Tapping within the a component card should request focus for that component's children.
              child: Focus(
                focusNode: focusNode,
                canRequestFocus: true, // Whether a widget can receive focus
                child: GestureDetector(
                  onTapDown: (_) {
                    focusNode.requestFocus();
                  },
                  behavior: HitTestBehavior.opaque, //ensures that a widget will respond to user interaction
                  // even if it’s invisible or transparent, and it prevents events
                  // from passing through to widgets beneath it.
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                      child: Center(child: widget.child),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
