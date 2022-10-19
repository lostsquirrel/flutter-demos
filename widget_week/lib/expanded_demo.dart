import 'package:flutter/material.dart';

import 'common.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded Demo')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildDemoBoxes(3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DemoBox(),
              Expanded(child: DemoBox()),
              DemoBox(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DemoBox(),
              Expanded(
                flex: 2,
                child: DemoBox(),
              ),
              DemoBox(),
              Expanded(child: DemoBox()),
            ],
          )
        ],
      ),
    );
  }
}
