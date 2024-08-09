import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

import '../../../constants.dart';

class SearchAnchorsWidget extends StatefulWidget {
  const SearchAnchorsWidget({super.key});

  @override
  State<SearchAnchorsWidget> createState() => _SearchAnchorsWidgetState();
}

class _SearchAnchorsWidgetState extends State<SearchAnchorsWidget> {
  String? selectedColor;
  List<ColorItem> searchHistory = [];

  Iterable<Widget> getSearchHistory(SearchController controller) => searchHistory.map(
        (history) => ListTile(
          leading: const Icon(Icons.history),
          title: Text(history.label),
          trailing: IconButton(
            icon: const Icon(Icons.call_missed),
            onPressed: () {
              controller.text = history.label;
              controller.selection = TextSelection.collapsed(offset: controller.text.length);
            },
          ),
          onTap: () {
            controller.closeView(history.label);
            handleSelection(history);
          },
        ),
      );

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String color = controller.value.text;
    return ColorItem.values.where((item) => item.label.contains(color)).map((filteredColor) => ListTile(
          leading: CircleAvatar(backgroundColor: filteredColor.color),
          title: Text(filteredColor.label),
          trailing: IconButton(
            icon: const Icon(Icons.call_missed),
            onPressed: () {
              controller.text = filteredColor.label;
              controller.selection = TextSelection.collapsed(offset: controller.text.length);
            },
          ),
          onTap: () {
            controller.closeView(filteredColor.label);
            handleSelection(filteredColor);
          },
        ));
  }

  void handleSelection(ColorItem colorItem) {
    setState(() {
      selectedColor = colorItem.label;
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      if(searchHistory.where((item) => item.label == colorItem.label).isEmpty) {
        searchHistory.add(colorItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Search colors',
      tooltipMessage: 'Use SearchAnchor or SearchAnchor.bar',
      child: Column(
        children: [
          SearchAnchor.bar(
            barHintText: 'Select color',
            suggestionsBuilder: (context, controller) {
              if (controller.value.text.isEmpty) {
                if (searchHistory.isNotEmpty) {
                  return getSearchHistory(controller);
                }
                return [
                  const Center(
                    child: Text(
                      'No search history',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ];
              }

              return getSuggestions(controller);
            },
          ),
          const SizedBox(height: 20),
          if (selectedColor == null) const Text('Select a color') else Text('Last selected color is $selectedColor')
        ],
      ),
    );
  }
}
