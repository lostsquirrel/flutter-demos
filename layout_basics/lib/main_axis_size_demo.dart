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
  final _sizes = MainAxisSize.values;
  int _sizeTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              ..._sizes.map((e) {
                return TextButton(
                  child: Text(e.toString()),
                  onPressed: () {
                    setState(() {
                      _sizeTypeIndex = _sizes.indexOf(e);
                    });
                  },
                );
              }).toList(),
            ],
          ),
          Row(
            mainAxisSize: _sizes[_sizeTypeIndex],
            children: buildBoxList(),
          ),
        ],
      ),
    );
  }
}
