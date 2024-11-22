import 'package:flutter/material.dart';

class ColorSlider extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final ValueChanged<double> onChanged;
  final bool allowChangeColor;
  final VoidCallback onButtonPressed;

  const ColorSlider(
      {super.key,
      required this.label,
      required this.value,
      required this.color,
      required this.onChanged,
      required this.allowChangeColor,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 255,
            divisions: 255,
            label: '${value.toInt()}',
            activeColor: color,
            onChanged: onChanged,
          ),
        ),
        if (allowChangeColor)
          FloatingActionButton(
            backgroundColor: color,
            onPressed: onButtonPressed,
            mini: true,
            child: Text(
              value.toInt().toString(),
              style: const TextStyle(color: Colors.white),
            ),
          )
        else
          Text(
            '${value.toInt()}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          )
      ],
    );
  }
}
