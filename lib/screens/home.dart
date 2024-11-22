import 'package:flutter/material.dart';
import 'package:exercise_2/widgets/drawer_settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _iconSize = 100;
  double _red = 81;
  double _green = 166;
  double _blue = 224;

  bool allowResize = true;
  bool allowChangeColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSettings(
        allowResize: allowResize,
        allowChangeColor: allowChangeColor,
        onResizeChanged: (value) => setState(() => allowResize = value),
        onColorChangeChanged: (value) =>
            setState(() => allowChangeColor = value),
      ),
    );
  }
}
