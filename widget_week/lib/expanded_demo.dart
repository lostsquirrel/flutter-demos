import 'package:flutter/material.dart';

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
            children: _buildItems(3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ExpandedDemoItem(),
              Expanded(child: ExpandedDemoItem()),
              ExpandedDemoItem(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ExpandedDemoItem(),
              Expanded(
                flex: 2,
                child: ExpandedDemoItem(),
              ),
              ExpandedDemoItem(),
              Expanded(child: ExpandedDemoItem()),
            ],
          )
        ],
      ),
    );
  }
}

List<ExpandedDemoItem> _buildItems(int n) {
  return List<int>.filled(n, 0)
      .map<ExpandedDemoItem>((e) => const ExpandedDemoItem())
      .toList();
}

class ExpandedDemoItem extends StatelessWidget {
  const ExpandedDemoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Colors.amber,
      child: const Text(""),
    );
  }
}
