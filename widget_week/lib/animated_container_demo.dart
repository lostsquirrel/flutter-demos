import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  static const _colors = [Colors.red, Colors.green, Colors.blue, Colors.orange];
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
    Alignment.center,
  ];
  static const _curves = [
    Curves.linear,
    Curves.fastOutSlowIn,
    Curves.fastLinearToSlowEaseIn,
  ];
  MaterialColor _color = _colors[_randomInt(_colors.length)];
  Alignment _alignment = _alignments[_randomInt(_alignments.length)];
  Curve _curve = _curves[0];
  Duration _duration = _randomDuration2();
  double _width = 128;
  double _height = 128;

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {"Color": _randomColor},
      {
        "linear": () => {
              setState(
                () {
                  _curve = Curves.linear;
                },
              )
            }
      },
      {
        "fastOutSlowIn": () => {
              setState(
                () {
                  _curve = Curves.fastOutSlowIn;
                },
              )
            }
      },
      {
        "fastLinearToSlowEaseIn": () => {
              setState(
                () {
                  _curve = Curves.fastLinearToSlowEaseIn;
                },
              )
            }
      },
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainerDemo')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: AnimatedContainer(
              duration: _duration,
              width: _width,
              height: _height,
              color: _color,
              alignment: _alignment,
              curve: _curve,
              child: const FlutterLogo(
                size: 64,
              ),
            ),
          ),
          const Divider(
            height: 10.0,
          ),
          Expanded(
            child: Wrap(
              children: buttons
                  .map<ElevatedButton>((e) => ElevatedButton(
                      onPressed: e.values.first, child: Text(e.keys.first)))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _randomColor() {
    setState(() => {
          _alignment = _alignments[_randomInt(_alignments.length)],
          _color = _colors[_randomInt(_colors.length)]
        });
  }

  void _randomDuration() {
    setState(() => {_duration = _randomDuration2()});
  }

  void _randomChange() {
    setState(() {
      _color = _colors[_randomInt(_colors.length)];

      _curve = _curves[_randomInt(_curves.length)];
      _duration = _randomDuration2();
      _width = _randomDouble();
      _height = _randomDouble();
    });
  }
}

Duration _randomDuration2() {
  var rng = Random();
  return Duration(microseconds: 500 + rng.nextInt(3000));
}

double _randomDouble() {
  return Random().nextDouble() * 512 + 48;
}

int _randomInt(int max) {
  return Random().nextInt(max);
}
