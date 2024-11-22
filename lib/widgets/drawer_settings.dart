import 'package:flutter/material.dart';

class DrawerSettings extends StatelessWidget {
  final bool allowResize;
  final bool allowChangeColor;
  final ValueChanged<bool> onResizeChanged;
  final ValueChanged<bool> onColorChangeChanged;

  const DrawerSettings(
      {super.key,
      required this.allowResize,
      required this.allowChangeColor,
      required this.onResizeChanged,
      required this.onColorChangeChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CheckboxListTile(
            title: const Text('Allow Resize'),
            value: allowResize,
            onChanged: (value) => onResizeChanged(value ?? false),
          ),
          CheckboxListTile(
              title: const Text('Allow Change Color'),
              value: allowChangeColor,
              onChanged: (value) => onColorChangeChanged(value ?? false))
        ],
      ),
    );
  }
}
