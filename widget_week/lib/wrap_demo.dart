import 'package:flutter/material.dart';

import 'common.dart';

class WrapDemo extends StatefulWidget {
  const WrapDemo({super.key});

  @override
  State<WrapDemo> createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  Axis _direction = Axis.horizontal;

  void _toggleDirection() {
    print("taped");
    setState(() {
      if (_direction == Axis.horizontal) {
        _direction = Axis.vertical;
      } else {
        _direction = Axis.horizontal;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap Demo')),
      body: GestureDetector(
        onTap: () => _toggleDirection(),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          direction: _direction,
          children: buildDemoBoxes(155),
        ),
      ),
    );
  }
}
