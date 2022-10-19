import 'package:flutter/material.dart';

class DemoBox extends StatelessWidget {
  const DemoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(1),
      color: Colors.amber,
      width: 48,
      height: 48,
      child: const Center(child: Text("X")),
    );
  }
}

List<DemoBox> buildDemoBoxes(int n) {
  return List<int>.filled(n, 0).map<DemoBox>((e) => const DemoBox()).toList();
}
