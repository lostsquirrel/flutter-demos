import 'package:flutter/material.dart';
import 'blue_box.dart';

class MainAxisAlignmentDemo extends StatefulWidget {
  const MainAxisAlignmentDemo({Key? key}) : super(key: key);
  static const displayName = "MainAxisAlignmentDemo";
  static const routeName = "/main-axis-alignment-demo";
  @override
  State<MainAxisAlignmentDemo> createState() => _MainAxisAlignmentDemoState();
}

class _MainAxisAlignmentDemoState extends State<MainAxisAlignmentDemo> {
  final _aligns = MainAxisAlignment.values;

  var _alignmentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                        _alignmentIndex = _aligns.indexOf(e);
                      });
                    },
                  );
                }).toList(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: _aligns[_alignmentIndex],
            children: buildBoxList(),
          ),
        ],
      ),
    );
  }
}
