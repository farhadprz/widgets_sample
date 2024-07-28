import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class ColorImageButtonWidget extends StatelessWidget {
  const ColorImageButtonWidget({
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
    return PopupMenuButton(
      icon: const Icon(Icons.image_outlined),
      onSelected: handleImageSelect,
      tooltip: 'Select a color extraction image',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) => List.generate(
        ColorImageProvider.values.length,
        (index) {
          final currentImageProvider = ColorImageProvider.values[index];
          return PopupMenuItem(
            value: index,
            enabled: currentImageProvider != imageSelected || colorSelectionMethod != ColorSelectionMethod.image,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 48),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(image: NetworkImage(currentImageProvider.url)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(currentImageProvider.label),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
