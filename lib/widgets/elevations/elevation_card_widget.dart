import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/elevations/elevation_info.dart';

class ElevationCardWidget extends StatefulWidget {
  const ElevationCardWidget({
    super.key,
    required this.info,
    this.shadowColor,
    this.surfaceTint,
  });

  final ElevationInfo info;
  final Color? shadowColor;
  final Color? surfaceTint;

  @override
  State<ElevationCardWidget> createState() => _ElevationCardWidgetState();
}

class _ElevationCardWidgetState extends State<ElevationCardWidget> {
  late double _elevation;

  @override
  void initState() {
    super.initState();
    _elevation = widget.info.elevation;
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(4.0),
          elevation: _elevation,
          color: Theme.of(context).colorScheme.surface,
          shadowColor: widget.shadowColor,
          surfaceTintColor: widget.surfaceTint,
          type: MaterialType.card,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Level ${widget.info.level}', style: Theme.of(context).textTheme.labelMedium),
                Text('${widget.info.elevation.toInt()} dp', style: Theme.of(context).textTheme.labelMedium),
                if (widget.surfaceTint != null)
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${widget.info.overlayPercent}%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
