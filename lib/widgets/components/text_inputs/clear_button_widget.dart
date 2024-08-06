import 'package:flutter/material.dart';

class ClearButtonWidget extends StatelessWidget {
  const ClearButtonWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => controller.clear(),
        icon: const Icon(Icons.clear),
      );
}
