import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ButtonsWithIcon extends StatelessWidget {
  const ButtonsWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(onPressed: () {}, label: const Text('Icon'), icon: const Icon(Icons.add)),
            colDivider,
            FilledButton.icon(onPressed: () {}, label: const Text('Icon'), icon: const Icon(Icons.add)),
            colDivider,
            FilledButton.tonalIcon(onPressed: () {}, label: const Text('Icon'), icon: const Icon(Icons.add)),
            colDivider,
            OutlinedButton.icon(onPressed: () {}, label: const Text('Icon'), icon: const Icon(Icons.add)),
            colDivider,
            TextButton.icon(onPressed: () {}, label: const Text('Icon'), icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
