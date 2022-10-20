import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  const OpacityDemo({super.key});

  @override
  State<OpacityDemo> createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Opacity Demo'),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: (details) =>
              _changeOpacity(details.primaryVelocity),
          child: Opacity(
            opacity: _opacity,
            child: Center(
              child: Container(
                width: 256,
                height: 256,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }

  void _changeOpacity(double? offset) {
    print(offset);
    if (offset != null) {
      var opacity = _opacity;

      opacity += offset / 1000;

      if (opacity < 0) {
        opacity = 0;
      }
      if (opacity > 1) {
        opacity = 1;
      }
      setState(() {
        // print(opacity);
        _opacity = opacity;
      });
    }
  }
}
