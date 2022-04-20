import 'package:flutter/material.dart';

import 'blue_box.dart';

class FlexibleDemo extends StatefulWidget {
  const FlexibleDemo({Key? key}) : super(key: key);
  static const displayName = "FlexibleDemo";
  static const routeName = "flexible-demo";

  @override
  State<FlexibleDemo> createState() => _FlexibleDemoState();
}

class _FlexibleDemoState extends State<FlexibleDemo> {
  final _fits = FlexFit.values;

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: _fits.map((e) {
              return TextButton(
                child: Text(e.toString()),
                onPressed: () {
                  setState(() {
                    _index = _fits.indexOf(e);
                  });
                },
              );
            }).toList(),
          ),
          Row(
            children: [
              const BlueBox(),
              Flexible(
                fit: _fits[_index],
                flex: 1,
                child: const BlueBox(),
              ),
              Flexible(
                fit: _fits[_index],
                flex: 1,
                child: const BlueBox(),
              )
            ],
          )
        ],
      ),
    );
  }
}
