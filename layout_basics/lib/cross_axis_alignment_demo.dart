import 'package:flutter/material.dart';

import 'blue_box.dart';

class CrossAxisAlignmentDemo extends StatefulWidget {
  const CrossAxisAlignmentDemo({Key? key}) : super(key: key);
  static const routeName = "/cross-axis-alignment-demo";
  static const displayName = "CrossAxisAlignmentDemo";
  @override
  State<CrossAxisAlignmentDemo> createState() => _CrossAxisAlignmentDemoState();
}

class _CrossAxisAlignmentDemoState extends State<CrossAxisAlignmentDemo> {
  final _aligns = CrossAxisAlignment.values;
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Column(
              children: _aligns.map((e) {
                return TextButton(
                  child: Text(e.toString()),
                  onPressed: () {
                    setState(() {
                      _index = _aligns.indexOf(e);
                    });
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: _aligns[_index],
              textBaseline: TextBaseline.alphabetic,
              children: const [
                BlueBox(),
                BlueBox(
                  height: 100,
                ),
                BlueBox()
              ],
            ),
          ],
        ));
  }
}
