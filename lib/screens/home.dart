import 'package:flutter/material.dart';
import 'package:exercise_2/widgets/drawer_settings.dart';
import 'package:exercise_2/widgets/action_button.dart';
import 'package:exercise_2/widgets/color_slider.dart';

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
      appBar: AppBar(
        title: const Text('My Icon', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.brown,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: allowResize
            ? <Widget>[
                ActionButton('-', () {
                  setState(() => _iconSize = (_iconSize - 50).clamp(100, 500));
                }),
                const SizedBox(
                  width: 10,
                ),
                ActionButton('S', () {
                  setState(() => _iconSize = 100);
                }),
                const SizedBox(
                  width: 10,
                ),
                ActionButton('M', () {
                  setState(() => _iconSize = 300);
                }),
                const SizedBox(
                  width: 10,
                ),
                ActionButton('L', () {
                  setState(() => _iconSize = 500);
                }),
                const SizedBox(
                  width: 10,
                ),
                ActionButton('+', () {
                  setState(() => _iconSize = (_iconSize + 50).clamp(100, 500));
                }),
                const SizedBox(
                  width: 10,
                ),
              ]
            : null,
      ),
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Icon(
              Icons.alarm,
              size: _iconSize,
              color: Color.fromRGBO(
                  _red.toInt(), _green.toInt(), _blue.toInt(), 1),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ColorSlider(
                  label: 'Red',
                  value: _red,
                  color: Colors.red,
                  onChanged: (value) => setState(() {
                    _red = value;
                  }),
                  allowChangeColor: allowChangeColor,
                  onButtonPressed: () {
                    setState(() {
                      _red = 255;
                      _green = 0;
                      _blue = 0;
                    });
                  },
                ),
                ColorSlider(
                  label: 'Green',
                  value: _green,
                  color: Colors.green,
                  onChanged: (value) => setState(() {
                    _green = value;
                  }),
                  allowChangeColor: allowChangeColor,
                  onButtonPressed: () {
                    setState(() {
                      _red = 0;
                      _green = 255;
                      _blue = 0;
                    });
                  },
                ),
                ColorSlider(
                  label: 'Blue',
                  value: _blue,
                  color: Colors.blue,
                  onChanged: (value) => setState(() {
                    _blue = value;
                  }),
                  allowChangeColor: allowChangeColor,
                  onButtonPressed: () {
                    setState(() {
                      _red = 0;
                      _green = 0;
                      _blue = 255;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
