import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.changeMaterialVersion,
    this.showTooltipBelow = true,
  });

  final void Function() changeMaterialVersion;
  final bool showTooltipBelow;

  @override
  Widget build(BuildContext context) {
    final isMaterial3 = Theme.of(context).useMaterial3;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: 'Switch to Material ${isMaterial3 ? 2 : 3}',
      child: IconButton(
        onPressed: changeMaterialVersion,
        icon: isMaterial3 ? const Icon(Icons.filter_2) : const Icon(Icons.filter_3),
      ),
    );
  }
}
