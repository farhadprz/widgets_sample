import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class BottomSheetsWidget extends StatefulWidget {
  const BottomSheetsWidget({super.key});

  @override
  State<BottomSheetsWidget> createState() => _BottomSheetsWidgetState();
}

class _BottomSheetsWidgetState extends State<BottomSheetsWidget> {
  bool isNonModalBottomSheetOpen = false;
  PersistentBottomSheetController? _nonModalBottomSheetController;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonList = [
      IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.archive_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
    ];
    List<Text> labelList = const [
      Text('Share'),
      Text('Add to'),
      Text('Trash'),
      Text('Archive'),
      Text('Settings'),
      Text('Favorite'),
    ];

    buttonList = List.generate(
      buttonList.length,
      (index) => Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buttonList[index],
            labelList[index],
          ],
        ),
      ),
    );

    //Row/Column: When you want children to be laid out in a single line, either horizontally or vertically,
      // and you have a predictable number of children.
    //Wrap: When you need a flexible layout that can adapt to varying amounts of content and wrap elements across
      // multiple lines if needed (like for a grid of tags or buttons).

    return ComponentDecoration(
      label: 'Bottom sheet',
      tooltipMessage: 'Use showModalBottomSheet<T> or showBottomSheet<T>',
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                showDragHandle: true,
                context: context,
                // TODO: Remove when this is in the framework https://github.com/flutter/flutter/issues/118619
                constraints: const BoxConstraints(maxWidth: 640),
                builder: (_) => SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: buttonList,
                    ),
                  ),
                ),
              );
            },
            child: const Text(
              'Show modal bottom sheet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              if (isNonModalBottomSheetOpen) {
                _nonModalBottomSheetController?.close();
                setState(() {
                  isNonModalBottomSheetOpen = false;
                });
                return;
              } else {
                setState(() {
                  isNonModalBottomSheetOpen = true;
                });
              }

              _nonModalBottomSheetController = showBottomSheet(
                elevation: 8.0,
                context: context,
                // TODO: Remove when this is in the framework https://github.com/flutter/flutter/issues/118619
                constraints: const BoxConstraints(maxWidth: 640),
                builder: (_) => SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: buttonList,
                    ),
                  ),
                ),
              );
            },
            child: Text(
              isNonModalBottomSheetOpen ? 'Hide bottom sheet' : 'Show bottom sheet',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
