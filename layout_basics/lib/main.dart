import 'package:flutter/material.dart';
import 'package:layout_basics/main_axis_size_demo.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (context) => Home(),
        MainAxisSizeDemo.routeName: (context) => MainAxisSizeDemo(),
      },
    );
  }
}

class RowTest extends StatefulWidget {
  const RowTest({Key? key}) : super(key: key);

  @override
  State<RowTest> createState() => _RowTestState();
}

class _RowTestState extends State<RowTest> {
  final _aligns = [
    MainAxisAlignment.start,
    MainAxisAlignment.end,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
    MainAxisAlignment.spaceAround
  ];

  var _alignment = MainAxisAlignment.start;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // const Text("MainAxisSize"),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ..._aligns.map((e) {
                return TextButton(
                  child: Text(e.toString()),
                  onPressed: () {
                    setState(() {
                      _alignment = e;
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: _alignment,
          children: [1, 2, 3].map((e) => const BlueBox()).toList(),
        ),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}
