import 'package:flutter/material.dart';
import 'package:widgets_sample/constants.dart';

class ExpandedImageColorActionWidget extends StatelessWidget {
  const ExpandedImageColorActionWidget({
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
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 150),
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          ColorImageProvider.values.length,
          (index) => Tooltip(
            message: ColorImageProvider.values[index].name,
            child: InkWell(
              borderRadius: BorderRadius.circular(4.0),
              onTap: () => handleImageSelect(index),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(4.0),
                  elevation: imageSelected == ColorImageProvider.values[index] &&
                          colorSelectionMethod == ColorSelectionMethod.image
                      ? 3
                      : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image(
                        image: NetworkImage(ColorImageProvider.values[index].url),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
