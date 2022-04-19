import 'package:flutter/material.dart';

import 'blue_box.dart';

class MainAxisSizeDemo extends StatefulWidget {
  const MainAxisSizeDemo({Key? key}) : super(key: key);
  static const displayName = 'MainAxisSizeDemo';
  static const routeName = '/main-axis-size';
  @override
  State<MainAxisSizeDemo> createState() => _MainAxisSizeDemoState();
}

class _MainAxisSizeDemoState extends State<MainAxisSizeDemo> {
  final _sizes = [MainAxisSize.max, MainAxisSize.min];
  int _sizeTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            ...[0, 1].map((e) {
              return TextButton(
                child: Text(_sizes[e].toString()),
                onPressed: () {
                  setState(() {
                    _sizeTypeIndex = e;
                  });
                },
              );
            }).toList(),
          ],
        ),
        Row(
          mainAxisSize: _sizes[_sizeTypeIndex],
          children: _buildBoxList(),
        ),
      ],
    );
  }

  List<BlueBox> _buildBoxList() =>
      [1, 2, 3].map<BlueBox>((e) => const BlueBox()).toList();
}
